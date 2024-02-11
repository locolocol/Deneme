@istest
public  class OpportunityCreateTest {
   @istest 
    public static void updateOpportunity() {
        list<account> accList = new list<account>();
        for(integer i=1; i<5; i++){
            account acc= new account();
                acc.name='Test';
                accList.add(acc);
          }
          test.startTest();
          insert accList;
          test.stopTest();
          list<opportunity> oppList =[select id,name from opportunity where AccountId =:accList[0].id];
          system.assertEquals('Test',accList[0].name);
        }
}
