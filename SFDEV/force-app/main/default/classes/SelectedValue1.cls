public class SelectedValue1 {
    
    public List<Account> accList {get;set;}
    public List<Account> accListNew {get;set;}
    public List<Contact> cntList {get;set;}
    public List<Contact> cntListNew {get;set;}
    public SelectedValue1(ApexPages.StandardController Controller)
    {
        accList = [select ID,select__c, Name, AccountNumber from Account];
        //for(Account a:accList){
          //  cntList = [select ID, LastName from Contact where AccountID=:a.ID];
        //}
		cntList = new List<Contact>();        
        cntListNew = new List<Contact>();
    }
    public void display(){
        for(Account a:accList){
            cntList = [select ID, LastName from Contact where AccountID=:a.ID];
            if(a.select__c == true){
                for(Contact c:cntList){
                    cntListNew.add(c);
                }
                
            }
        }
    }
    
    
}