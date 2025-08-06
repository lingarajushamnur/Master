trigger ChkLeadchkBox on Lead (before insert, before update) {
    List<lead> leads = new List<Lead>();
    if(trigger.isInsert){
        if(trigger.isBefore){
            for(Lead l:trigger.new){
                if(l.Status == 'Working - Contacted'){
                    l.Select__c = true;
                   //leads.add(l);
                    
                }
              // insert leads; 
            }
            
        }
    }
    if(trigger.isUpdate){
        if(trigger.isBefore){
            for(Lead l:trigger.new){
                if(l.Select__c == true && l.Status == 'Working - Contacted'){
                    l.Rating = 'Hot';
                    l.Description = 'test description';
                }
            }
        }
    }

}