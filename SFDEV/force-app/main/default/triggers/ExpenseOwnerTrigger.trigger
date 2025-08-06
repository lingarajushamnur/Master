trigger ExpenseOwnerTrigger on Expense_Management__c (after insert, after update) {
    String msgs;
    String subjectStr;
    
    For(Expense_Management__c exm : Trigger.New){
        User uDetail = [SELECT id, Email FROM User WHERE id = :exm.CreatedById LIMIT 1];
        
        if(Trigger.isInsert){
            subjectStr='Expense Created';
            msgs='Expense has been submitted for approval';
        }
        if(Trigger.isUpdate && (exm.Reimbursement_Amount__c!=Trigger.oldMap.get(exm.Id).Reimbursement_Amount__c || exm.Amount_Spent__c!=Trigger.oldMap.get(exm.Id).Amount_Spent__c)){
            subjectStr='Expense Amount Updated';
            msgs='Reimbursement Amount has been updated and submitted for approval';
        }
        
        EmailManager.sendMail(uDetail.Email, subjectStr, msgs);
    }
}

// && (exm.Reimbursement_Amount__c!=Trigger.oldMap.get(exm.Id).Reimbursement_Amount__c || exm.Amount_Spent__c!=Trigger.oldMap.get(exm.Id).Amount_Spent__c))