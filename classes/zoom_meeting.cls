public class zoom_meeting {
   public Static String CreateMeeting(RequestParamsWrapper Rqwrapper) {
        String eventJson = JSON.serialize(Rqwrapper);
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.zoom.us/v2/users/me/meetings');
        req.setHeader('Authorization', 'Bearer '+ System.Label.Zoom_BearerToken);
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Accept', 'application/json');
        req.setMethod('POST');
        req.setBody(eventJson);
        HttpResponse res = h.send(req);
        System.debug('res'+res.getBody());
       if(test.isRunningTest()) {
                    String resp;
                    resp = Zoom_CreateMeetingOn_Mock_Response.mockCallout();
                    return resp;
                }
        if(!test.isRunningTest() && res.getStatusCode() == 201) {
            System.debug('res'+res.getBody());
            String resp = res.getBody();
            System.debug('resp before  : '+resp);
            resp = 	resp.replace('number', 'number1');
            System.debug('resp after  : '+resp);
            return resp;
        }
        
        return null;
    }
    
    public class RequestParamsWrapper {
        public string agenda;
        public boolean default_password;
        public integer duration;
        public string password;
        public boolean pre_schedule;
        public string topic;
        public integer type;
        public string start_time;
        public string timezone;
        public Settings settings;
    }
    
    public class Settings {
        public boolean schedule_for_reminder;
        public boolean host_video;
        public boolean private_meeting;
        public boolean participant_video;
        public boolean mute_upon_entry;
        public integer approval_type;
        public string alternative_hosts;
        public boolean close_registration;
        public boolean waiting_room;
        public boolean registrants_confirmation_email;
        public boolean registrants_email_notification;
        public integer registration_type;
        public boolean meeting_authentication;
        public boolean show_share_button;
        public boolean allow_multiple_devices;
        public string encryption_type;
        public boolean email_notification;
        public boolean focus_mode;
        public string audio;
    }
    
    public class Responsewrpper{
        public String start_url;
        public String join_url;
        public String Id;
        public String host_id;
        public String created_at;
        public Integer duration;
    }
}