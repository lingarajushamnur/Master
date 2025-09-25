public class OppChkBox {
    public List<Opportunity> oppList {get;set;}
    public List<Opportunity> oppListNew {get;set;}
    
    //@testvisible
    public OppChkBox(apexpages.StandardController Controller)
    {
        oppList = [select Select__c, Name from Opportunity];
        oppListNew = new List<Opportunity>();
    }
    public void display(){
        for(opportunity O:oppList){
            if(O.Select__C == true){
                oppListnew.add(O);
            }
        }
    }
        
}