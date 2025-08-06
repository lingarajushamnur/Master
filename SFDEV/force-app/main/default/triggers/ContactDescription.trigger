trigger ContactDescription on Contact (before insert, before update) {
    for(Contact C:trigger.new){
        if(trigger.isInsert){
            
            C.Description = 'Test description';
        }
        
        if(trigger.isUpdate){
            C.Description ='Test Description for update';
            
        }
    }
}