public class oppDetailsChk {
	public List<Opportunity> OppList = new List<Opportunity>();
    public List<Opportunity> OppListNew = new List<Opportunity>();
    
    public oppDetailsChk(ApexPages.StandardController Controller){
        OppList = [Select Id, Name, CloseDate, Select__C from Opportunity];
        OppListNew = new list<Opportunity>();
    }
    public void display(){
        for(Opportunity O:OppList){
            if(O.Select__C == true){
                OppListNew.add(O);
            }
        }
    }
}