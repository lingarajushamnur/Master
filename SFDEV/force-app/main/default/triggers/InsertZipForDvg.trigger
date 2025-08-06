trigger InsertZipForDvg on Contact (before insert, before update, before delete) {
    
    for(Contact cnt : trigger.new)
    {
        if(trigger.isInsert){
            if(cnt.MailingCity == 'DVG')
            {
                cnt.MailingPostalCode = '577004';
                cnt.Description = 'test Description';
            }
            
        }
        
        if(trigger.isUpdate){
            cnt.Description = 'Contact updated successfully by'+userInfo.getUserName();
        }
        
    }
    
    if(trigger.isDelete){
        for(Contact cnt : trigger.old)
        {
            if(cnt.AccountId == null)
            {
                //cnt.addError('Account is empty for this contact, you can not delete this contact');
                cnt.Description.addError('Account is empty for this contact, you can not delete this contact');
                //Apexpages.addMessage('Account is empty for this contact, you can not delete this contact');
            }
        }
    }
    
}