trigger ContactnamePrefix on Contact (before insert, before update) {
    for(Contact C:trigger.new){
        C.FirstName = 'Dr.'+C.FirstName;
    }

}