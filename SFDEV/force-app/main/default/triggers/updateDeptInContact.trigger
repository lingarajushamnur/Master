trigger updateDeptInContact on Account (after insert, after update) {
    if(trigger.isInsert && trigger.isUpdate){
        List<Contact> cntList = new List<Contact>();
        for(Account a:trigger.new){
            
            if(a.Type == 'Prospect')
            {
                for(Contact con:[Select Id from Contact where AccountId =:a.Id])
                {
                    con.Department = 'IT';
                    con.AccountId = a.Id;
                    cntList.add(con);
                }
            }
            
    }
        
            if(cntList.size()>0)
            {
                upsert cntList;
            }
        }
    
}