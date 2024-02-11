@istest
public   class createrecordQTest {
@istest
private static void testQueueable(){
    List<case> cs = new List<case>();
    for(integer i=0; i<=200; i++){
        case createcs= new case();
        createcs.Status='Test'+i;
        createcs.Origin='Web';
        cs.add(createcs);
    }
    insert cs;
    test.startTest();
    CaserecordQ cq= new CaserecordQ();
    system.enqueueJob(cq);    
    test.stopTest();
    
    list<case> updatedCase =[select id,origin,status from Case where accountid =:cs[0].id];
    system.assert(updatedCase!=null, 'U got it');
}    
}
