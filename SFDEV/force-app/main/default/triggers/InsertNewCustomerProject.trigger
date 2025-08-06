trigger InsertNewCustomerProject on Opportunity (after insert) {
    if(trigger.isInsert){
        List<Customer_Project__c> Cp = new List<Customer_Project__c>();
        for(Opportunity O:trigger.new){
            Customer_Project__c c = new Customer_Project__c(Name = O.Name,
                                                            Status__c = 'Active',
                                                            OpportunityName__c = O.Id);
            Cp.add(c);
        }
        if(Cp.size()>0){
            insert Cp;
        }
    }
}