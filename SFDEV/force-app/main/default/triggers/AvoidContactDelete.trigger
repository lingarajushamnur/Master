trigger AvoidContactDelete on Contact (before delete) {
    for(Contact c:trigger.old){
        if(c.AccountId == null){
            c.addError('cannot Delete');
        }
    }

}