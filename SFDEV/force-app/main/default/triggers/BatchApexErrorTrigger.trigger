trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {
    List<BatchLeadConvertErrors__c > blcer = new List<BatchLeadConvertErrors__c>();
    for(BatchApexErrorEvent event:trigger.new){
        BatchLeadConvertErrors__c  blcer1 = new BatchLeadConvertErrors__c();
        blcer1.AsyncApexJobId__c = event.AsyncApexJobId;
        blcer1.Records__c = event.JobScope;
        blcer1.StackTrace__c = event.StackTrace;
        blcer.add(blcer1);
    }
    if(blcer.size()>1){
        insert blcer;
    }

}