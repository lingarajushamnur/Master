trigger InsertCon on Account (after insert) {
    if(trigger.isInsert){
        List<Contact> cntList = new List<Contact>();
        for(Account a:trigger.new){
            Contact C = new Contact(Lastname = 'abc',AccountId = a.Id);
            cntList.add(C);
        }
        if(cntList.size()>0)
        {
            insert cntList;
        }
    }

}