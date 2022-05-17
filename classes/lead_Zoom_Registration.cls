global class lead_Zoom_Registration implements Database.AllowsCallouts, Database.Stateful, Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc) {
        
        String query = 'Select id, FirstName,LastName,Email,Meeting_Id__c '+
            'from lead where Meeting_ID__c != null and Is_Registration_Done__c= false';
        return database.getQueryLocator(query);
    }
    
    global void execute(database.BatchableContext bc, List<lead> leads) {
 
        list<Zoom_Registration__c> ZmReglist = new list<Zoom_Registration__c>();
        if(leads != Null && leads.size() > 0) {
            if(leads.size() >0 && leads !=null) {
                
            for(lead ld : leads) {
                try{
                list<Registrants> regList = new list<Registrants>();
                RequestRegParamsWrapper Rqwrapper = new RequestRegParamsWrapper();
                Rqwrapper.auto_approve=true;
                Registrants reg = new Registrants();
                reg.first_name = ld.FirstName;
                reg.last_name = ld.LastName;
                reg.email = ld.Email;
                regList.add(reg);
                Rqwrapper.registrants = regList;
                
                Zoom_ResponseWrap_BatchReg response = (Zoom_ResponseWrap_BatchReg)JSON.deserialize(CreateRegistration(Rqwrapper,ld.Meeting_Id__c),Zoom_ResponseWrap_BatchReg.class);
                if(response.registrantsResponse!=null && response.registrantsResponse.size() > 0){
                    Zoom_Registration__c zmReg = new Zoom_Registration__c();
                    zmReg.Auto_Approve__c = true;
                    zmReg.Email__c = ld.Email;
                    zmReg.Lead__c = ld.id;
                    zmReg.First_Name__c = ld.FirstName;
                    zmReg.Last_Name__c = ld.LastName;
                    zmReg.Event_ID__c = ld.Event__c;
                    zmReg.Meeting_ID__c = ld.Meeting_Id__c;
                    ld.Is_Registration_Done__c = true;
                    ld.Join_URL__c = response.registrantsResponse.get(0).join_url;
                    ld.Registrant_ID__c = response.registrantsResponse.get(0).registrant_id;
                    zmReg.Join_Url__c = response.registrantsResponse.get(0).join_url;
                    zmReg.Registrant_Id__c = response.registrantsResponse.get(0).registrant_id;
                    
                    ZmReglist.add(zmReg);
                }
            }catch(Exception e) {
                    
                }
                }
                
            }
        }
        if(leads != null && leads.size() >0){
            update leads;
        }
        if(ZmReglist != null && ZmReglist.size() > 0) {
            insert ZmReglist;
        }
    }
    
    
    public Static String CreateRegistration(RequestRegParamsWrapper Reqwrapper, String meetingID) {
        String leadJson = JSON.serialize(Reqwrapper);
        System.debug('leadJson'+leadJson);
        //Zoom_Credential__mdt JWT = Zoom_Credential__mdt.getAll().values();
        //String Zoom_BearerToken=JWT.JWT_Token__c;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        String endPoint = 'https://api.zoom.us/v2/meetings/' + meetingID + '/batch_registrants';
        req.setEndpoint(endPoint);
        req.setHeader('Authorization', 'Bearer ' + System.Label.Zoom_BearerToken);
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');
        req.setMethod('POST');
        req.setBody(leadJson);
        if(test.isRunningTest()) {
            String resp = zoom_registration_mock.mockCallout();
            
            return resp;
        }
        HttpResponse res = h.send(req);
        System.debug('res'+res.getBody());
        if(!test.isRunningTest() && res.getStatusCode() == 201) {
            System.debug('res'+res.getBody());
            String resp = res.getBody();
            return resp;
        }
        
        return null;
    }
    
    global void finish(database.BatchableContext bc){
        
    }
    
     public class RequestRegParamsWrapper {
        public Boolean auto_approve;
        public List<Registrants> registrants;
    }
    
    public class Registrants {
        public String first_name;
        public String email;
        public String last_name;
    }
    
    public class Zoom_ResponseWrap_BatchReg {
	public boolean auto_approve;
    public List<RegistrantsResponse> registrantsResponse;
    }
    public class RegistrantsResponse {
        public String registrant_id;
		public String email;
		public String join_url;
    }
    
}