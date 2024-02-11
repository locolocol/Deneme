public   class AccountUpdateTrigger {
    public static void createContact(list<account> accList){
        list<contact> conlist = new List<contact>();
        for(account acc: accList){
            contact con = new contact();
                con.lastname = acc.Name;
                con.AccountId = acc.id;
                conlist.add(con);
            }
            if(!conlist.isEmpty()){
                insert conlist;
        }
       
        }
    }
    
 
