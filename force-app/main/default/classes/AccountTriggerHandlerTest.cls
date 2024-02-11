// this is the second Branch Test
@istest
public  class AccountTriggerHandlerTest {
@istest
public static void relatedContactCreated(){
    list<account> accList = new list<account>();
    for(integer i=1; i<=6; i++){
        account acc = new account();
        acc.name ='Test';
        acclist.add(acc);
    }
    test.startTest();
    insert accList;
    test.stopTest();

List<Contact> conlist=[select  id, name from contact where accountId = : accList[0].id];
system.assertEquals(5, accList.size());
}
}
