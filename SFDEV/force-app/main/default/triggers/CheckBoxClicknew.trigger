trigger CheckBoxClicknew on Opportunity (after insert,after update) {
    List<Account> accList = new List<Account>();
    for(Opportunity O:trigger.new){
        //List<Opportunity> OppList = new List<Opportunity>([select Id, StageName, name from opportunity]);
        if(O.StageName == 'Prospect'){
            Account a = new Account();
            a.Id = O.AccountId;
            a.Select__c = true;
            accList.add(a);
        }
        if(accList.size()>0){
            insert accList;
        }
    }

}