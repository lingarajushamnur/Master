global class UpdateContactAddresses implements Database.Batchable<sobject>, Database.Stateful{
    Integer i = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name, Sequence__c FROM Contact'
        );
    }

    
    global void execute(Database.BatchableContext bc, List<Contact> listEmployee){
        for(Contact e : listEmployee){
            e.Sequence__c = i;
            i = i+1;
            system.debug('i==='+i);
        }
        system.debug('i==='+i);
    }
    
    global void finish(Database.BatchableContext bc){
    }
}