public class ApexOne {
    List<Account> lstAccount = new List<Account>([Select Id, Name, Description from Account where Name Like '%test%']);
    List<Account> lstAccountUpdated = new List<Account>();
   // for(Account acc:lstAccount)
    //{
      //  acc.Description = 'Add test description to all the test accounts';
        //lstAccountUpdated.add(acc);
    //}

}