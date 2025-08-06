trigger updateDeptInContactnew2 on Account (after update){
   List<Contact> contactList = new List<Contact>();
   List<Contact> contactList1 = new List<Contact>();
for(Account acc: [SELECT Id, Type,(SELECT Id,Department FROM Contacts) FROM Account WHERE Id in: Trigger.new]){
   If(acc.Type == 'Prospect'){
     contactList.addAll(acc.Contacts);
    }
}
for(contact c:contactList){
       c.Department='IT';
       contactList1.add(c);
}
update contactList1;
}