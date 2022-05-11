global class Batch_Zoom_Attendance implements Database.AllowsCallouts, Database.Stateful, Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc) {
        
        String query = 'Select id, Meeting_ID__c,registrant_id__c,is_Attendance_Updated__c,email__c,Lead__c '+
            'from Zoom_Registration__c where is_Attendance_Updated__c = false and Meeting_ID__c != null';
        return database.getQueryLocator(query);
    }
    
    global void execute(database.BatchableContext bc, List<Zoom_Registration__c> RegList) {
        if(RegList != null && RegList.size() > 0) {
            Map<String,ID> RegMap = new Map<String,ID>();
            for(Zoom_Registration__c zm : RegList) {
                RegMap.put(zm.registrant_id__c, zm.id);
                System.debug('zm.Meeting_ID__c'+zm.Meeting_ID__c);
            }
            
            if(!RegMap.isEmpty()) {
                List<Zoom_Attendance__c> attList = new List<Zoom_Attendance__c>();
                List<lead> leadUpdateList = new List<lead>();
                for(Zoom_Registration__c zm : RegList) {
                    try{
                        ResponseWrapper respWrapper = (ResponseWrapper)JSON.deserialize(callout(zm.Meeting_ID__c), ResponseWrapper.class);
                        
                        System.debug(respWrapper);
                        Double count = 0;
                        if(respWrapper.participants != null && respWrapper.participants.size() > 0 ) {
                            for(participants at : respWrapper.participants) {
                                if(RegMap.containsKey(at.id) && zm.Registrant_Id__c == at.id && at.status=='in_meeting') {
                                    Zoom_Attendance__c att = new Zoom_Attendance__c();
                                    att.Duration__c = at.duration;
                                    att.Id__c = at.id;
                                    att.User_Id__c = at.user_id;
                                    att.Name__c = at.name;
                                    att.User_Email__c = at.user_email;
                                    att.join_time__c = at.join_time;
                                    att.Leave_Time__c = at.leave_time;
                                    zm.Start_Time__c = at.join_time;
                                    att.Zoom_Registration__c = RegMap.get(at.id);
                                    count = count + at.duration;
                                    attList.add(att);
                                }
                            } 
                        }
                        
                        zm.Total_duration__c = count;
                        Zm.is_Attendance_Updated__c = true;
                        
                        lead ld = new lead();
                        ld.Id = zm.Lead__c;
                        
                        ld.Session_Attended__c = true;
                        ld.Total_Session_Attended_duration__c	= count; 
                        
                        leadUpdateList.add(ld);
                        SYstem.debug('list   '+ld);
                    }
                    
                    catch(exception e){
                        System.debug('meeting does not exist');
                    }
                }
                if(attList != null && attList.size() > 0) {
                    insert attList;
                }
                
                if(leadUpdateList != null && leadUpdateList.size() > 0) {
                    update leadUpdateList;
                }
                if(Reglist != null && Reglist.size() >0) {
                    update Reglist;
                }
            }
            
            
        }
    }
    
    public Static String callout(String meetingId) {
        JWT_Token__mdt JWT = JWT_Token__mdt.getAll().values();
        String Zoom_BearerToken=JWT.JWT_Token__c;
        String endpoint = 'https://api.zoom.us/v2/report/meetings/' + meetingId + '/participants?page_size=30&next_page_token=&include_fields=registrant_id';
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setHeader('Authorization', 'Bearer '+ Zoom_BearerToken);
        req.setHeader('Accept', 'application/json');
        req.setMethod('GET');
        
        if(test.isRunningTest()) {
String resp = zoom_attendance_mock.mockCallout();

return resp;
        }
        
        HttpResponse res = h.send(req);
        System.debug('res'+res.getBody());
        
        if(!test.isRunningTest() && res.getStatusCode() == 200 ) {
            System.debug('res'+res.getBody());
            String resp = res.getBody();
            return resp;
        }
        
        return null;
    }
    
    global void finish(database.BatchableContext bc) {
    }
    
    public class ResponseWrapper {
        public Integer page_count;
        public Integer page_size;
        public Integer total_records;
        public string next_page_token;
        public List<Participants> participants;
    }
    
    public class Participants{
        public string id;
        public string user_id;
        public string name;
        public string user_email;
        public string join_time;
        public string leave_time;
        public Integer duration;
        public string attentiveness_score;
        public Boolean failover;
        public string status;
        public string customer_key;
        public string registrant_id;
    }
}