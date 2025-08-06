public with sharing class ContactController {
    @AuraEnabled
    public static List<Contact> getContacts(){
        List<Contact> contacts = [Select Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact];
        
        return contacts;			
    }
    
}