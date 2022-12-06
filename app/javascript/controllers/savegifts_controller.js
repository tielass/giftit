import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-gifts"
export default class extends Controller {
  static targets = ["save"]
  connect() {
    console.log("Save gift log")
  }

  togglegifts(event) {
    event.preventDefault(event);
    event.currentTarget.remove(this.eventTarget);
    //this.saveTarget.classList.add("d-none")
    //this.saveTarget.classList.remove("d-none")
    //event.currentTarget.classlist.add("d-none")
    //.then((data) => {
    //  this.saveTarget.outerHTML = data
    //})
    }
    //console.log("method applied")
    //event.preventDefault();
    //this.hobbyTarget.classList.toggle("d-none")
  //disconnect() {
  //  $(this.data.get('removeSelector')).remove()
  //}
}
