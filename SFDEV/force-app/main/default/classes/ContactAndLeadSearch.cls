public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(string name)
    {
        List<List<sObject>> searchList = [FIND :name Returning Contact(FirstName,LastName),Lead(FirstName,LastName)]; 
        return searchList;
      }

}