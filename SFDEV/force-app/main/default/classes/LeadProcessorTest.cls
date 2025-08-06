@istest
public class LeadProcessorTest {
    
    @testsetup
    static void setup(){
        List<Lead> Leads = new List<Lead>();
        for(integer i=0;i<200;i++){
           Leads.add(new Lead(LastName='Lead'+i,Company='SLK', Industry ='IT'));
        }
        insert Leads;
    }
    static testMethod Void test(){
        Test.startTest();
        LeadProcessor Lp = new LeadProcessor();
        Id batchId = Database.executeBatch(Lp);
        Test.stopTest();
        
        system.assertEquals(200, [select count() from Lead where Industry = 'IT']);
    }
	
}