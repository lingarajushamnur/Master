// flowWrapper.js
import { LightningElement, api, track } from 'lwc';

export default class FlowWrapper extends LightningElement {
    @api flowName;
    @track isFlowLoaded = false;
    @track isLoading = true;

    renderedCallback() {
        if (this.flowName && !this.isFlowLoaded) {
            this.isFlowLoaded = true;
            this.isLoading = false;
        }
    }

    handleStatusChange(event) {
        if (event.detail.status === 'FINISHED') {
            // Handle flow status change if needed
        }
    }

    handleFlowFinish(event) {
        // Handle flow finish event if needed
    }

    handleFlowError(event) {
        // Handle flow error event if needed
    }
}