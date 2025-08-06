trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
   List<Task> taskList = new List<Task>();
   //Iterate through the input records.
   for(Opportunity opp: Trigger.new) {
       // Check if the StageName is Closed Won and isChanged incase of update.
       if(opp.StageName == 'Closed Won' && (Trigger.isInsert || opp.StageName != Trigger.oldMap.get(opp.Id).StageName)) {
           taskList.add(new Task(Subject = 'Follow Up Test Task', WhatId = opp.Id));
       }
   }
   
   // Check if the taskList is empty or not.
   if(!taskList.isEmpty()){
       insert taskList;
   }
}