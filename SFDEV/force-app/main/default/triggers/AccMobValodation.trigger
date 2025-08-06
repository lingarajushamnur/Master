trigger AccMobValodation on Account (before insert,before update) {
    if(trigger.isInsert){
        
        for(Account a:trigger.new){
            if(a.Mob__c == null){
                a.Mob__c.addError('Required field');
            }
        }
    }
        if(trigger.isUpdate){
            for(Account a:trigger.new){
                if(a.Type == 'Prospect'){
                    a.Select__c = true;
                }
            }
        }
    
}