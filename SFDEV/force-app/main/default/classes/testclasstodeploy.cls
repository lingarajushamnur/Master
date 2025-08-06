public class testclasstodeploy {
 @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, Industry, Type, Phone, Website FROM Account]; // Limit to one account for simplicity
    }
}