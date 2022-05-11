@istest
public class Test_zoom_meeting {
    @istest
    public static void test(){
        set<id> ids = new set<id>();
    Event__c ev = new Event__c();
    ev.Name = 'testevent';
    ev.Event_Id__c = '56';
    ev.Event_Start_Date__c = system.today();
    ev.Event_End_Date__c = system.today()+5;
    ev.Meeting_Id__c = '89294370707';
    insert ev;
        ids.add(ev.id);
    	
       Create_Meeting.zoom_meet(ids);
        
        
    	lead ld = new lead();
    	ld.FirstName='test';
        ld.LastName = 'er';
        ld.Email = 'aksss@gmail.com';
        ld.event_Id__c = ev.Event_Id__c;
        ld.Company = 'dd';
        ld.Meet_Id__c = ev.Meeting_Id__c;
        ld.Is_Registration_Done__c=false;
        insert ld;
        System.debug('meeting id' + ld.Meeting_Id__c);
        
       
        
        
       
        lead_Zoom_Registration br = new lead_Zoom_Registration();
        Database.executeBatch(br);
        
         Zoom_Registration__c zm =new Zoom_Registration__c();
        zm.lead__c=ld.Id;
        zm.Meeting_ID__c = ev.Meeting_Id__c;
        zm.is_Attendance_Updated__c = false;
        zm.email__c= 'aksss@gmail.com';
        zm.registrant_id__c = '1111';
        insert zm;
        
        Batch_Zoom_Attendance be = new Batch_Zoom_Attendance();
        Database.executeBatch(be);
        
    }
}