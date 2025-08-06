public class Employeetestcontroller {
    
    public EmployeeNew__c Emp{get; set;}
    
    public Employeetestcontroller(){
        Emp = new EmployeeNew__c();
    }
    public PageReference save(){
        upsert Emp;
        PageReference p = new PageReference('www.google.com');
        return p;
            }
}