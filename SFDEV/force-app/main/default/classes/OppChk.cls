public class OppChk {
    public List<Opportunity> oppList {get;set;}
    public List<Opportunity> oppListNew {get;set;}
    
    public OppChk(ApexPages.StandardController Controller)
    {
        oppList = [Select Select__c, Name, Closedate from Opportunity];
        oppListNew = new List<opportunity>();
    }
    public void display(){
        for(Opportunity o:oppList){
            if(o.Select__c == true){
                oppListNew.add(o);
            }
        }
    }

}