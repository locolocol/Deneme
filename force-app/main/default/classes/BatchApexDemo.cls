//1-4-22 turkish assignment  Bir Account‟a bağlı;  Opportunity yoksa bir opportunity, // Contact yoksa bir Contact,
//Opportinitiy ve Contact yoksa birer Opportunity ve Contact oluşturan bir batchable apex tasarlayınız,
// finish() kısmında kaç adet Opportunity ve Contact oluşturulduğunu system.debug() vasıtası ile yazdırınız 
//ve her cumartesi 02:00 AM saatinde execute edilecek şekilde planlayınız.

public class BatchApexDemo implements DataBase.Batchable<sObject>, Database.stateful  {
        public Integer recordCountOpp =0;
        public integer recordCountCon =0;
        public database.QueryLocator start(database.BatchableContext bc){
           return Database.getQueryLocator([select ID,(select Id from opportunities),(select id from contacts) from Account]);
        }
        public void execute (Database.BatchableContext bc, list<account> accList){
            list<contact> con = new list<contact>();
            list<Opportunity> opp = new List<Opportunity>();
            for(account acc:accList ){
                if(acc.contacts.isEmpty())
               con.add(new Contact(AccountId=acc.id,lastname='Test'));
                recordCountCon++;
            }
               for(account acc:accList ){
                 if(acc.opportunities.isEmpty()){
                opp.add(new Opportunity(AccountId=acc.id,Name='Test', stageName ='Prospecting', CloseDate = system.today()));
                recordCountOpp++;               
            }
        }
        Boolean ExceptionOccour = false;

        try{
            if(!con.isEmpty()){
                insert con;
            }
        }catch (Exception e){
            ExceptionOccour = true;
        }
        try{
            if(!opp.isEmpty()){
                insert opp;
            }
        }catch (Exception e){
            ExceptionOccour =true;
        }
    }
        public void finish(Database.BatchableContext bc){
            system.debug('total of Contact # records '+ recordCountOpp );
            system.debug('total of Oppotunities # records'+  recordCountOpp);

        }
   }
    
 
