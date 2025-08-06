trigger LeadNamePrefix on Lead (before insert, before update) {
    for(Lead L:trigger.new){
        L.FirstName = 'Dr.'+ L.FirstName;
    }

}