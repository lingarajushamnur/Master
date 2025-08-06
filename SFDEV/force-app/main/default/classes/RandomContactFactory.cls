public class RandomContactFactory {

    public static List<Contact> generateRandomContacts (integer nNumContacts, string sLastName)
    {
        List<Contact> lContactList = new List<Contact>();
        
        for(integer i=0; i<nNumcontacts; i++)
        {
            Contact c = new Contact(LastName= sLastName, FirstName = 'Test ' +i);
            lContactList.add(c);

        }    
        return lContactList;
    }
    
}