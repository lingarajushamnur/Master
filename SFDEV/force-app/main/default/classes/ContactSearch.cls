public class ContactSearch {
    public static List<Contact> searchForContacts(string name,string code)
    {
                List<Contact> ctsList=[Select Id, Name FROM Contact WHERE lastname=:name AND MailingPostalCode=:code];      
        return ctsList;
        
    }

}