public with sharing class ContactService {

    public static void createContactForAccount(String accountName) {
        Nebula.Logger.info('--- Start: createContactForAccount for accountName: ' + accountName);

        try {
            // Step 1: Query for Account
            List<Account> accounts = [
                SELECT Id, Name 
                FROM Account 
                WHERE Name = :accountName
            ];

            if (accounts.isEmpty()) {
                 Nebula.Logger.warn('No Account found with name: ' + accountName);
                return;
            }

            if (accounts.size() > 1) {
                 Nebula.Logger.warn('Multiple Accounts found for name: ' + accountName + '. Proceeding with the first one.');
            }

            Account acc = accounts[0];
             Nebula.Logger.debug('Account selected: Id = ' + acc.Id + ', Name = ' + acc.Name);

            // Step 2: Create a new Contact
            Contact newContact = new Contact(
                FirstName = 'Demo',
                LastName = 'User',
                Email = 'demo.user@example.com',
                AccountId = acc.Id
            );

            insert newContact;

             Nebula.Logger.info('Contact created successfully: Id = ' + newContact.Id + ', AccountId = ' + acc.Id);

        } catch (DmlException dmlEx) {
             Nebula.Logger.error('DML Exception occurred: ' + dmlEx.getMessage(), dmlEx);

        } catch (Exception ex) {
             Nebula.Logger.error('Unexpected error in createContactForAccount: ' + ex.getMessage(), ex);
        }

         Nebula.Logger.info('--- End: createContactForAccount for accountName: ' + accountName);
        Nebula.Logger.saveLog();
    }
}