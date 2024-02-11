////Account objecti'nin description field'inde bir update işlemi yapıldığında o account'a 
//bağlı opportunity ve contact'ların description field'lerini account description ile aynı olacak şekilde update eden bir
// future method" tasarlayınız.
public class FutureDemo12 {
    /*public static void updateDescriptionHelper(list<account> accTriggernew, map<id,account> accTriggerOldMap) {
        set<id> acId = new set<id>();
        for(account ac : accTriggernew){
            if(ac.Description != accTriggerOldMap.get(ac.id).Description){
                acId.add(ac.id);
            }
        }
    if(!acId.isEmpty()){
        updateDescription(acId);
    }
    }
    @future
    public static void updateDescription(set<id> idList){
        list<contact> conList= [select id,description,account.Description from contact where accountid in :idlist];
        for(contact con : conList){
            con.Description =con.Account.Description;
        }
        update conlist;
        list<opportunity> oppList=[select id,description,account.description from Opportunity where AccountId in :idList];
        for(Opportunity opp: oppList){
            opp.Description = opp.Account.Description;
        }
        update opplist;
    }*/
}
