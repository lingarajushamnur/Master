public class ContactChk {
    
    public List<Contact> CntList {get;set;}
    public List<Contact> CntListNew {get;set;}
    
    public ContactChk(ApexPages.StandardController Controller){
        CntList = [Select Select__c, Name, Phone, Email from Contact];
        CntListNew = new List<Contact>();
    }
    public void display(){
        for(Contact c:CntList){
            if(c.Select__c == true){
                CntListNew.add(c);   
            }
            
        }
        
    }
}