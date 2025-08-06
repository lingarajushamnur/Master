public class FirstClass1 {
    
     public static void FirstMethod1(){
         /*Integer intvar = 52565;
         String str = 'Chandru';
         boolean bool = true;
         Date currentdate = date.today();
         system.debug(currentdate);
         
         Account acc = new Account();
        
         //acc.Name = 'Chandru account';
         //Insert acc;
         
        acc = [Select Id, Name from Account where Name = 'Chandru account'];
         acc.AnnualRevenue = intvar ;
         //acc.Name = 'Chandru';
         //Update acc;
         Delete acc;

         Account acc1 = new Account();
         acc1 = [Select Id, Name from Account where Name = 'Chandru'];
         acc1.Name = 'Chandru123';
         Update acc1;*/
         
         List<String> listfstring = new List<String>{'string1','string1','string3'};
             system.debug(listfstring);
         //listfstring.set(1,'replacewithset');
         system.debug(listfstring);
         List<Integer> listfinteger = new List<Integer>();
         listfinteger.add(55);
         listfinteger.add(65);
         system.debug(listfinteger.get(1));
         listfinteger.clear();
          system.debug(listfinteger);
        

         List<Account> listfaccunt = new List<Account>();
         listfaccunt = [Select Id, Name from Account where Name = 'Chandru'];
         system.debug(listfaccunt);
         
         
            set<string> set1 = new set<String>{'string1','string1','string3'};
                set<integer> set2 = new set<integer>();
                set2.add(55);
         		set2.add(65);
         		system.debug(set2);
         		set2.remove(55);
         		system.debug(set2);
               	system.debug(set2.contains(65));
         		system.debug(set2);
                //contains
                system.debug(set1);
          set<Account> setacc = new set<Account>();
         Map<String,string> maptest = new Map<String,string>{'91'=>'India','001'=>'USA'};
             system.debug(maptest);
         maptest.put('002','UK');
         maptest.put('003','Canada');
         system.debug(maptest);
         system.debug(maptest.containskey('004'));
         system.debug(maptest.get('001'));
         system.debug(maptest.keyset());
        
    }

}