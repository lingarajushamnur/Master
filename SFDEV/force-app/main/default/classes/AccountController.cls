public with sharing class AccountController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Industry, Type, Phone, Website FROM Account]; // Limit to one account for simplicity
    }
    
     @AuraEnabled
    public static void saveCSVToServer(String csvData) {
        System.debug('csvData==='+csvData);
        Blob csvFile = Blob.valueOf(csvData);
        ContentVersion cv = new ContentVersion();
        cv.Title = 'accounts.csv';
        cv.PathOnClient = 'accounts.csv'; // Set the PathOnClient field
        cv.VersionData = csvFile;
        
        insert cv;
        System.debug('cv==='+cv);
        Nebula.logger.info('This is an info message.');
    }
    
    @AuraEnabled
    public static Id createContentDocument(Id parentId, String fileName, String base64Data) {
        ContentVersion cv = new ContentVersion();
        cv.Title = fileName;
        cv.VersionData = EncodingUtil.base64Decode(base64Data);
        cv.PathOnClient = fileName;
        insert cv;

        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id = :cv.Id].ContentDocumentId;
        cdl.LinkedEntityId = parentId;
        cdl.ShareType = 'V';
        insert cdl;

        return cv.ContentDocumentId;
    }
}