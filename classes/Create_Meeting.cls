public class Create_Meeting {
    @Future(callout=true)
    public static void zoom_meet(set<Id> ids){
        list<Event__c> events = new list<Event__c>();
        if(ids!= null && ids.size()>0){
            events = [select id,name,Event_Start_Date__c,Event_End_Date__c,Start_URL__c,Host_Id__c,Meeting_Id__c from Event__c where id IN:ids];
        }
        if(events!= null && events.size()>0){
        for(Event__c ev : events){
            if(ev.Event_End_Date__c!=null && ev.Event_Start_Date__c != null){
            zoom_meeting.RequestParamsWrapper Rqwrapper = new zoom_meeting.RequestParamsWrapper();
            		Rqwrapper.agenda = ev.Name;
                    Rqwrapper.default_password = false;
                    Rqwrapper.duration = (Integer.valueOf(ev.Event_End_Date__c.getTime() - ev.Event_Start_Date__c.getTime()))/1000/60;
                    Rqwrapper.password = '46wer4f';
                    Rqwrapper.pre_schedule = false;
                    Rqwrapper.topic = ev.Name;
                    Rqwrapper.type = 2;
                    Rqwrapper.start_time =String.valueOf(ev.Event_Start_Date__c);
                    Rqwrapper.timezone = 'IN';
                    
                    //Settings Wrapper
                    zoom_meeting.Settings sett = new zoom_meeting.Settings();
                    sett.schedule_for_reminder = true;
                    sett.host_video = false;
                    sett.private_meeting = true;
                    sett.participant_video = true;
                    sett.mute_upon_entry = true;
                    sett.approval_type = 0;
                    sett.alternative_hosts = '';
                    sett.close_registration = true;
                    sett.waiting_room = false;
                    sett.registrants_confirmation_email = true;
                    sett.registrants_email_notification = true;
                    sett.registration_type = 1;
                    sett.meeting_authentication = false;
                    sett.show_share_button = true;
                    sett.allow_multiple_devices = true;
                    sett.encryption_type = 'enhanced_encryption';
                    sett.email_notification = true;
                    sett.focus_mode = true;
                    sett.audio = 'both';
                    
                    Rqwrapper.settings = sett;
            
           zoom_meeting.Responsewrpper response = (zoom_meeting.Responsewrpper)JSON.deserialize(zoom_meeting.CreateMeeting(Rqwrapper), zoom_meeting.Responsewrpper.class);
            if(response != NULL) {
            ev.Start_URL__c=response.start_url;
            ev.Host_Id__c=response.host_id;
            ev.Meeting_Id__c=response.Id;
            }
        }
        }
        update events;
    }
    }

}