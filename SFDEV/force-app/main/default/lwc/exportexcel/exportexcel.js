//Exportexcel
import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import saveCSVToServer from '@salesforce/apex/AccountController.saveCSVToServer';

export default class Exportexcel extends LightningElement {
    accounts;

    @wire(getAccounts)
    wiredAccounts({ error, data }) {
        if (data) {
            this.accounts = data;
            this.exportToCSV();
        } else if (error) {
            console.error(error);
        }
    }

    async exportToCSV() {
        if (this.accounts && this.accounts.length > 0) {
            const csv = this.generateCSV(this.accounts);
            const encodedUri = encodeURI(`data:text/csv;charset=utf-8,${csv}`);
            const link = document.createElement('a');
            link.setAttribute('href', encodedUri);
            link.setAttribute('download', 'accounts.csv');
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            console.log('blob12355==='+csv);
            await saveCSVToServer({ csvData: csv });
            
            //saveCSVToServer({ csvFile: blob, csvFileName: csvFileName });

        }
    }

    generateCSV(data) {
        const header1 = ['Account Info', '', 'Test 1', '', 'Test 3'].join(',');
        const header2 = ['Name', 'Industry', 'Type', 'Phone', 'Website'].join(',');
        const rows = data.map(obj => Object.values(obj).map(value => `"${value}"`).join(','));
        return `${header1}\n${header2}\n${rows.join('\n')}`;
    }
}