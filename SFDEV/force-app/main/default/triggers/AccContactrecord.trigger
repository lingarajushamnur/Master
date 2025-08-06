trigger AccContactrecord on Account (before insert,before update,after insert,after update) {
    
    List<Contact> con = new List<Contact>();
    
    for(Account acc:Trigger.new){
        if(acc.Active__c == 'yes' ){
            Contact c = new Contact();
            c.AccountId = acc.Id;
            c.LastName = 'Chandru';
            c.Email = 'chandru@gmail.com';
            con.add(c);
        }
    }
    insert con;

    if((trigger.isinsert || trigger.isupdate) && trigger.isbefore){
        for(Account acc:Trigger.new){
            if(acc.AccountNumber == '' || acc.AccountNumber == null){
                acc.AccountNumber.addError('Account Number is required');
            }
            
        }
    }
    
}