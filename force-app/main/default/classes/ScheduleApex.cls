public  class ScheduleApex implements Schedulable{
     public void execute (SchedulableContext scb) {
         Database.executeBatch(new BatchApexDemo());
    }
}
 