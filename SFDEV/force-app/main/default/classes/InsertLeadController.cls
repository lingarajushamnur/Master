public class InsertLeadController {
    public string statusOptions{get;set;}
    public string company{get;set;}
    public string mobile{get;set;}
    public string firstName{get;set;}
    public string lastName{get;set;} 
    
    public Lead l = new Lead();
    
    public List<SelectOption> getItems(){
        
        List<SelectOption> options=new List<SelectOption>();
        options.Add(new SelectOption('Open-Not Contacted','Open-Not Contacted'));
        options.Add(new SelectOption('Working-Not Contacted','Open-Not Contacted'));
        options.Add(new SelectOption('Closed-Converted','Open-Converted'));
        options.Add(new SelectOption('Closed-Not Converted','Open-Not Converted'));
        return options;
    }
    
    public PageReference submitLead()
    {
        l.FirstName=firstName;
        l.LastName=lastName;
        l.Company=company;
        l.MobilePhone=mobile;
        l.Status=statusOptions;
        insert l;
        return null;
    }

}