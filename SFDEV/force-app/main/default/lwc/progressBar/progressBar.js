import { LightningElement, api, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import { RefreshEvent } from "lightning/refresh";
import getAccountRecord from '@salesforce/apex/AccountController.getAccountRecord';

export default class ProgressBar extends LightningElement {
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