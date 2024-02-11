public   class CaserecordQ implements Queueable {
   public void execute(QueueableContext qc){
    list<case> cs = new List<case>();
    for(integer i=1; i<5; i++){
        case createcs= new case();
        createcs.Status='New';
        createcs.Origin='Phone';
        cs.add(createcs);
    }
    if(!cs.isEmpty()){
        insert cs;
    }
   }
}
