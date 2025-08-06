trigger CheckBoxClicknewone on Opportunity (after insert,after update) {

    List<Account> accList = new List<Account>();
    for(Opportunity O:trigger.new){
        //List<Opportunity> OppList = new List<Opportunity>([select Id, StageName, name from opportunity]);
        if(O.StageName == 'Prospect'){
            Account a = new Account(Select__c = true,
                                    Id = O.AccountId);        
            accList.add(a);
        }
        if(accList.size()>0){
            insert accList;
        }
    }
}