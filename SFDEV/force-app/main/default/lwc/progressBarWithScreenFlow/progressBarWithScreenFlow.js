import { LightningElement } from 'lwc';

export default class progressBarWithScreenFlow extends LightningElement {
    base = ['a','b','c','d','e','f'];

    get steps(){
      return this.base.map( option => { return {'label':option,'value':option, 'key':option}});
    }
    
    get nextText(){
      return this._currentStepInternal > this.base.length ? 'Finish' : 'Next';
    }
    
    _currentStepInternal = 1;
    get currentStep(){
      if (this._currentStepInternal === this.base.length|| this._currentStepInternal === this.base.length + 1 ){
        return this.steps[this.steps.length -1].label;
      }
      return this.steps[this._currentStepInternal-1].label;
    }
    
    handleNext(){
      if (this._currentStepInternal > this.base.length){
        //do finish
      }
      else {
        this._currentStepInternal++;
      }
    }
    
    handlePrevious(){
      this._currentStepInternal--;
    }
}