import { LightningElement, api } from 'lwc';
import { RefreshEvent } from 'lightning/refresh';
export default class RefereshPOC extends LightningElement {
    @api recordId;

    refreshView(event) {
        // refresh the standard related list
        this.dispatchEvent(new RefreshEvent());
    }
}