trigger AccounTrigger on account (before insert, before update, after insert, after update) {
  if(trigger.isBefore&& trigger.isInsert){
    try{
      list<Contact> conList = new list<Contact>();
      for(Account acc: trigger.new){
        conList.add(new Contact(status__c= false,AccountId = acc.Id));       
      }   
      if(!conList.isEmpty()){
          insert conList;         
      }          
            }
          catch (Exception e) {
           system.debug('Please see the Error'+e.getMessage());
           for(account acc1: trigger.new){
             acc1.addError('Error please contact to ..Admin');
          }
       }
      }
   }


   



    
    
    

   
 