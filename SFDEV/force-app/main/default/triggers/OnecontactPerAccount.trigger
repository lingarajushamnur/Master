trigger OnecontactPerAccount on Contact (before insert) {
    for(contact con : trigger.new){
        if(con.accountId != null){
            Id a = con.accountId;
            list<contact> cList = [SELECT Id FROM Contact Where AccountId = :a];
            if(cList.size() > 0){
                con.addError('no more primary contacts');
            }
        }
    }

}