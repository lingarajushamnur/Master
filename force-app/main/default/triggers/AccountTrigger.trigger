trigger AccountTrigger on Account (before insert,before update,after insert, after update,after undelete) {
    if((trigger.isinsert || trigger.isupdate) && trigger.isafter){
        List<Contact> listcnt = new List<Contact>();
        for(Account a:trigger.new){
            
            if(a.Active__c == 'Yes'){
                Contact c = new Contact();
                c.LastName = 'chNDRU244';
                c.AccountId = a.Id;
                listcnt.add(c);
            }
           
        }
        insert listcnt;
        Nebula.Logger.info('Contact Inserted succesfully '+listcnt[0].Name);
        Nebula.Logger.saveLog();

    }
    if((trigger.isinsert || trigger.isupdate) && trigger.isbefore){
        for(Account a:trigger.new){
            if(a.mob__c == '' || a.mob__c == null){
                a.mob__c.adderror('mobile number is required');
            }
        }
    }
   

}