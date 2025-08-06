public without sharing class Controlacc {
    public Account account{get; set;}
    //public string msg{get;set;}
    public Controlacc(){
        account = new Account();
    }
    
    public void save(){
        try{
            upsert account;
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Record insert successfully'));
        }
        catch(Exception e){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,e.getMessage()));
        }
    }
    
}