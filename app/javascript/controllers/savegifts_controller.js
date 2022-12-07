import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="save-gifts"
export default class extends Controller {
  static targets = ["remove"]
  connect() {
    // console.log("Save gift log")
  }

  removegifts(event) {
    event.preventDefault();
    console.log("Function log")
    event.currentTarget.remove();
    //this.saveTarget.classList.add("d-none")
    //this.saveTarget.classList.remove("d-none")
    //event.currentTarget.classlist.add("d-none")
    //.then((data) => {
    //  this.saveTarget.outerHTML = data
    //})
    }
    //console.log("method applied")

    //this.hobbyTarget.classList.toggle("d-none")

    disconnect() {
      $(this.data.get('removeSelector')).remove()
    }
}
