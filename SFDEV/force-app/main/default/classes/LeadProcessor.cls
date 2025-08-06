global class LeadProcessor implements Database.Batchable<sObject>,
Database.Stateful{
    
    global Integer recordprocessed = 0;
    
    global Database.QueryLocator Start(Database.BatchableContext bc){
        return Database.getQueryLocator('Select Id,Company, Name, LeadSource from Lead');
        
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope)
    {
        List<Lead> lead = new List<Lead>();
        for(Lead l:scope)
        {
            l.Company = 'Dreamforce';
           // l.LeadSource = 'Web';
            lead.add(l);
            recordprocessed = recordprocessed+1;
        }
        update Lead;
    }
    global void finish(Database.BatchableContext bc){
        system.debug('records processed = '+recordprocessed);
        AsyncApexJob job = [Select Id, Status, NumberOferrors from AsyncApexJob
                            where Id = :bc.getJobId()];
    }
    
}