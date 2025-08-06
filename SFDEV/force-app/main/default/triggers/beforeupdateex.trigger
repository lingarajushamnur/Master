trigger beforeupdateex on Account (before update) {

    if(trigger.isUpdate){
        for(Account a:trigger.new){
            if(a.Type == 'Prospect'){
                a.Phone = '5252536252';
            }
        }
    }

}