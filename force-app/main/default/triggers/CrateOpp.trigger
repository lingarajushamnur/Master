trigger CrateOpp on Account (after insert) {
    
        if(trigger.isInsert){
            List<Opportunity> Opp = new List<Opportunity>();
            
            for(Account acc:trigger.new){
                Opportunity O = new Opportunity();
                O.Name = acc.Name;
                O.CloseDate = Date.today();
                O.StageName = 'Closed Won';
                O.AccountId = acc.Id;
                Opp.Add(O);
                
            }
            if(Opp.Size() > 0){
                insert Opp;
            }
        }
}