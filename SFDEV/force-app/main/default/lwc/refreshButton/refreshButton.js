// refreshButton.js
import { LightningElement } from "lwc";


export default class RefreshButton extends LightningElement {
    handleRefresh() {
        // Dispatch a custom event to trigger refresh
        console.log('Dispatching refresh event');
        const refreshEvent = new CustomEvent('refresh');
        this.dispatchEvent(refreshEvent);
    }
}