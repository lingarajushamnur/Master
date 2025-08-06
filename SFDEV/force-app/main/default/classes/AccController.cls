public class AccController {
    @AuraEnabled
    public static Account saveAccount (Account acc) {
        upsert acc;
        return acc;
    }
}