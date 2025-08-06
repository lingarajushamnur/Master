trigger CheckLActiveChkboxOpp on Customer_Project__c (after insert,after update) {
    List<Opportunity> OppList = new List<Opportunity>();
    for(Customer_Project__c C : trigger.new){
        if(C.Status__c == 'Active')
        {
            Opportunity O = New Opportunity(id=C.OpportunityName__c);
            O.Active_Customer_project__c = true;
            OppList.add(O);
        }
        if(OppList.size() > 0)
        {
            Update OppList;
        }
    }
    
}