public class ListCaseController {
    public List<Case> caseList{get;set;}
    
    public void testcaserec(){
        caseList = [Select ID,CaseNumber from Case];
       
    }
}