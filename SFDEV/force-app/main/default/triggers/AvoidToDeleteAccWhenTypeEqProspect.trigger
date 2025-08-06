trigger AvoidToDeleteAccWhenTypeEqProspect on Account (before delete) {
    if(trigger.isDelete){
        for(Account a:trigger.old){
            if(a.Type == 'Prospect'){
                a.Type.addError('Cannot Delete');
            }
        }
    }

}