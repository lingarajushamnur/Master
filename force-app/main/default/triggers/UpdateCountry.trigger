trigger UpdateCountry on Contact (after delete,after insert,after undelete, after update) {

set<Id>AcctIds=new set<Id>();

if(trigger.isInsert||trigger.isUpdate||trigger.isUndelete){
      
    for (Contact c:trigger.new){
      //adding new AccountId to set    
      AcctIds.add(c.AccountId);
      if(trigger.isUpdate){
        if(trigger.oldMap.get(c.Id).AccountId !=c.AccountId || trigger.oldMap.get(c.Id).MailingCountry != c.MailingCountry){
          //adding old AccountId to set if contact is moving from one account to other   
          AcctIds.add(trigger.oldMap.get(c.Id).AccountId);        
        }    
      }     
    }
      
}    
else if(trigger.isDelete){
      
  for (Contact c:trigger.old){
    AcctIds.add(c.AccountId);  
  }     
}    
  
if(AcctIds.size()>0){
  list<Account>acct=new list<Account>();
      for(Account a:[select Id,MailingCountry__c,(select Id,MailingCountry__c from contacts) from account where Id in :AcctIds]){
        Set<String> mailingCountries = new Set<String>();
        String mailingContriesCSV =' '; 
        for(contact con:a.Contacts){
          if(con.MailingCountry__c !=null ){
            mailingCountries.add(con.MailingCountry__c.toUpperCase());
          } 
              
        }

        for(String country : mailingCountries){mailingContriesCSV+=country+',';} 

        a.MailingCountry__c = mailingContriesCSV.trim().removeEnd(',');
        acct.add(a);  
          
      } 
    update acct;  
  }  
  
  
}