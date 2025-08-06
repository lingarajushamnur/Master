import { LightningElement, api, wire, track } from 'lwc';

export default class VerticalProgressBar extends LightningElement {
    handleStageClick(event) {
        const flowName = event.currentTarget.dataset.flow;
        const flow = this.template.querySelector('lightning-flow-support');
        flow.startFlow(flowName);
    }

    handleFlowStatusChange(event) {
        if (event.detail.flowStatus === 'FINISHED') {
            // Handle flow finished
            // You might want to update UI or perform other actions
        }
    }
}