trigger SendMailToEmployees on Job_Posting__c (after insert, after update) {
    if(trigger.isinsert)
    {
        for(Job_Posting__c jp:trigger.new)
        {
            if(jp.Status__c == 'Open'){
               // List<string> empList = new List<string>([select Email_ID__c from Employee__c]);
                List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();   
                Messaging.SingleEmailMessage mail =  new Messaging.SingleEmailMessage();
                List<Employee__c> empList = new List<Employee__c>([select Email_ID__c from Employee__c]);
                String[] toAddresses = new String[] {}; 
                    
                    mail.setToAddresses(toAddresses);
                
                mail.setReplyTo('lingarajushamnur@gmail.com');
                mail.setSenderDisplayName('Lingaraju N');
                
                if(mails.size()>0)	{
                    Messaging.sendEmail(mails);
                }
                
            }
            
            
            
            
        }
        
    }
}