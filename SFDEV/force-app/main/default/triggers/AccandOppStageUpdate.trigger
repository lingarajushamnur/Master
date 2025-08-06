trigger AccandOppStageUpdate on Account (after insert, after update) {
    for(Account a:trigger.new){
        List<Opportunity> OppList = new List<opportunity>();
        if(a.Type == 'Prospect'){
            for(Opportunity O:[Select Id,StageName from Opportunity where AccountId =:a.Id]){
                O.StageName = 'Prospect';
                OppList.add(O);
            }
            if(OppList.size()>0){
                Update OppList;
            }
        }
        
    }

}