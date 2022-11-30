import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="eventhobby"
export default class extends Controller {
  static targets = ["hobby", "saved"]
  connect() {
    console.log(this.hobbyTarget)
  }

  displayHobby() {
    this.hobbyTarget.classList.toggle("d-none")
  }

  displaySaved() {
    this.savedTarget.classList.toggle("d-none")
  }
}
