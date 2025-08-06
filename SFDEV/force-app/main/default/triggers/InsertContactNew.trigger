trigger InsertContactNew on Account (after insert) {
    if(trigger.isInsert){
        List<Contact> cnt = new List<Contact>();
        for(Account acc : trigger.new)
        {
            Contact c = new Contact(FirstName = 'Linga',
                                    LastName = 'raju', AccountId = acc.Id);
            cnt.add(c);
        }
        if(cnt.size() > 0)
        {
            insert cnt;
        }
        
        
    }
}