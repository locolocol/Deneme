public   class OpportunityCreateClass {
    public static void createOpportunity(list<account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(account ac: accList){
             oppList.add(new Opportunity(AccountId=ac.id,Name='Test',StageName='Closed Won',CloseDate=system.today()));
        }
        if(!opplist.isEmpty()){
            insert opplist;
        }
    }
}
