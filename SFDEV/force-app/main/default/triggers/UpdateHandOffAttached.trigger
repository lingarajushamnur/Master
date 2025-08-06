trigger UpdateHandOffAttached on Top_X_Designation__c (after insert,after update,after delete) {
    if(trigger.isAfter){
        if(trigger.isInsert){
            
        }
    }

}