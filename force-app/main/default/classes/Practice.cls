public class Practice implements Database.batchable<sobject>,Database.stateful{
    integer countOpp=0;
    integer countCon=0;    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return database.getQueryLocator([select id,(select id from contacts),(select id from opportunity) from Account]);
    }
    public void execute (Database.BatchableContext bc,List<Account> accList){
        list<contact> conList = new List<contact>();
        list<opportunity> oppList = new List<Opportunity>();
        for(account acc: accList ){
            if(acc.Contacts.isEmpty()){
              conlist.add(new contact(LastName='Test',accountid=acc.id));
              countCon++;
            }
            for(account acc: accList){
                if(acc.Opportunities.isEmpty()){
                    oppList.add(new Opportunity(AccountId=acc.id,stagename='Closed Won',CloseDate=system.today()));
                    countopp++;
                }
            }
            boolean exceptionOccur = false;
            try {
                if(!oppList.isEmpty()){
                    insert oppList;
                }                
            } catch (Exception e) {
                exceptionOccur =true;
            }
            try {
                if(!conList.isEmpty()){
                    insert conList;
                }
                
            } catch (Exception e) {
                exceptionOccur= true;
                
            }
        }

    }
    public void finish(Database.BatchableContext bc){
        system.debug('opportunity  has been created'+ countOpp);
        system.debug('contact has been created ', countCon);

    }
}







 
