import { LightningElement, api } from 'lwc';

export default class ParentComponent extends LightningElement {
    @api recordId; // Account record Id passed from the record page
    refreshFlag = false;

    handleRefresh() {
        // Toggle the refresh flag to trigger re-rendering of the child component
        this.refreshFlag = !this.refreshFlag;
    }
}