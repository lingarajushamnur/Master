import { LightningElement, api, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import { RefreshEvent } from "lightning/refresh";
import getAccountRecord from '@salesforce/apex/AccountController.getAccountRecord';

// Define the fields to retrieve
const FIELDS = ['Account.LastModifiedDate'];

export default class CollapsibleSectionsWithFlow extends LightningElement {
    @api recordId;  // Account record passed from the record page
    @api refreshFlag; 
    accountLastModifiedDate;
    currentDate = new Date();
    wiredRecordResult;
    refreshComponent = false; 

    @track flowVariables = [];

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    wiredRecord(result) {
        this.wiredRecordResult = result;
        if (result.data) {
            const lastModifiedDate = new Date(result.data.fields.LastModifiedDate.value);
            const currentDate = new Date();
            const isToday = lastModifiedDate.toDateString() === currentDate.toDateString();
            const color = isToday ? 'green' : 'red';
            const expiredText = !isToday ? ' (expired)' : '';
            const formattedDate = result.data.fields.LastModifiedDate.value.toLocaleString('en-US', { timeZoneName: 'short' });
            console.log('log0', result.data);
            console.log('Flow variables:0', JSON.stringify(result.data));
            this.flowVariables = 
            [{ name: 'recordID', type: 'String', value:this.recordId }];
        
            console.log('log1', this.flowVariables);
            this.sections = this.sections.map(section => {
                const sectionTitle = `${section.title} Last Modified: <span style="color: ${color};">${formattedDate}</span>${expiredText}`;
                section.title = sectionTitle;
                section.lastModifiedDate = lastModifiedDate.toDateString();
                section.expired = !isToday;

                return section;
            });
        } else if (result.error) {
            console.error('Error fetching Account last modified date', result.error);
        }
    }
    
    sections = [
        { id: '1', title: 'Income', isExpanded: false, flowName: 'expenseScreenFlow' ,lastModifiedDate: '', expired: false },
        { id: '2', title: 'Expense', isExpanded: false, flowName: 'expenseScreenFlow',lastModifiedDate: '', expired: false  },
        { id: '3', title: 'Non ASB Liabilities', isExpanded: false, flowName: 'expenseScreenFlow',lastModifiedDate: '', expired: false  }
    ];
    // Object to hold dynamic icon names for each section
    buttonIconNames = {};

    getButtonIconName(section) {
        return section.isExpanded ? 'utility:chevronup' : 'utility:chevrondown';
    }

    connectedCallback() {
        // Initialize buttonIconNames with initial icon names
        this.sections.forEach(section => {
            this.buttonIconNames[section.id] = this.getButtonIconName(section);
        });
    }

    getButtonIconName(section) {
        return section.isExpanded ? 'utility:chevronup' : 'utility:chevrondown';
    }

    get sectionsWithIcons() {
        return this.sections.map(section => ({
            ...section,
            buttonIconName: this.getButtonIconName(section)
        }));
    }

    handleToggleSection(event) {
       // console.log(sections);
        const sectionId = event.target.dataset.id;
        this.sections = this.sections.map(section => {
            if (section.id === sectionId) {
                section.isExpanded = !section.isExpanded;
            }
            return section;
        });
        //console.log(sections); 
    }

    handleFlowStatusChange(event) {
        const sectionId = event.target.getAttribute('data-section-id');
        const flowStatus = event.detail.status;
        if (flowStatus === 'FINISHED' || flowStatus === 'ERROR') {
            this.sections = this.sections.map(section => {
                if (section.id === sectionId) {
                    section.flowName = null; // to force re-rendering of the flow component
                }
                return section;
            });
        }
    }
    beginRefresh() {
        this.dispatchEvent(new RefreshEvent());
      }
    
}