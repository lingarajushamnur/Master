public with sharing class ContactClass {
    public string recid{get;set;}
    Public Boolean ShowpageBlockFlag{get;set;}
  
    public string row{ get; set;}
    public list<Contact> Conlst{get;set;}
    public boolean editSection{get;set;}
    public boolean editSection1{get;set;}
    public string editConRole{get;set;}
    public string contactId {get;set;}
    public string firstName{get;set;}
    public string lastName{get;set;}
    public String phone{get; set;}
    public String id{get; set;}
    Public Contact A{get;set;}
    public Contact ct{get;set;}
    
    public List<Contact> contacts {get; set;}
    
    public ContactClass(){
        
        Conlst = [select Id,FirstName,LastName,Phone from Contact ];
        contacts=null;
        A=new Contact();
        ShowpageBlockFlag=false;
        
    }
    
    public PageReference setupContacts()
    {
        system.debug('inside setup');
        A=[select id, FirstName, LastName, Phone from Contact where Id=:recId];
        system.debug('A----'+A);
        ShowpageBlockFlag=true;
        return null;
    }
    public void  doEdit()
    {
        ct=[select id, FirstName, LastName from Contact where Id=:recId];
        firstName = ct.FirstName;
        lastName = ct.LastName;
        //return new PageReference('/apex/ContactDetailPage?Id=' + recid);
        editSection = true;
        //return null;
    }
    public void doUpdate(){
       
        update ct;
     
    }
    
    
}