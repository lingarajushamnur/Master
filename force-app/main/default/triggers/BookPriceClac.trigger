trigger BookPriceClac on Books__c (before insert, before update) {
    for(Books__c B:trigger.new){
       B.Price__c *=  0.9 ;
    }

}