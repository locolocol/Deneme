 																				
import { LightningElement } from 'lwc';
//HardTyping This line
import { ShowToastEvent } from 'lightning/platformShowToastEvent'; // Type this manually wont show it auto if you don’t impont message wont show
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
export default class LightningRecordFormOpp extends LightningElement {
    recordId= "0064x00000KmEHOAA3";
    objectName= OPP_OBJECT;
    fields = [ACCOUNT_FIELD, NAME_FIELD, TYPE_FIELD, STAGE_FIELD, AMOUNT_FIELD, CLOSEDATE_FIELD];
    
    //Show Error Message
    successHandler(){ // This is your message part
      const successToast = new ShowToastEvent({
         title : " Success",
         message : "Opportunity has saved successfully",
         variant : "success" // variant means what kind of variant you want ,info, success, error, warning

      });
      this.dispatchEvent(successToast); // Dispatch to screen where under this lwc under this current teamplate dispatch  successToast  message
    }
}