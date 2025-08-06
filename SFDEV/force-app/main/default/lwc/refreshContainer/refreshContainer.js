// refreshContainer.js
import { LightningElement } from "lwc";
import { registerRefreshContainer, unregisterRefreshContainer } from "lightning/refresh";

export default class RefreshContainer extends LightningElement {
  refreshContainerID;
  connectedCallback() {
    this.refreshContainerID = registerRefreshContainer(this, this.refreshContainer);
    // if the component runs in an org with Lightning Locker instead of LWS, use
    // this.refreshContainerID = registerRefreshContainer(this.template.host, this.refreshContainer.bind(this));
  }
  disconnectedCallback() {
    unregisterRefreshContainer(this.refreshContainerID);
  }
  refreshContainer(refreshPromise) {
    console.log("refreshing");
    return refreshPromise.then((status) => {
      if (status === REFRESH_COMPLETE) {
        console.log("Done!");
      } else if (status === REFRESH_COMPLETE_WITH_ERRORS) {
        console.warn("Done, with issues refreshing some components");
      } else if (status === REFRESH_ERROR) {
        console.error("Major error with refresh.");
      }
    });
  }
}