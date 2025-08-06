public class sendrecordstovfpage {
    
    public List<Account> accList{get;set;}
    
    public sendrecordstovfpage(){
        accList=[select name,Id,mob__c from Account limit 10];
    }
   

}