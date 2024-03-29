import { Controller } from "@hotwired/stimulus"
import Tagify from '@yaireo/tagify'

// Connects to data-controller="add-hobby"
export default class extends Controller {
  static targets = ["addHobby"]
  connect() {
    console.log('connected')
    new Tagify(this.addHobbyTarget, {
      whitelist: [ "Technology",
                    "Chocolate",
                    "Food",
                    "Cooking",
                    "Running",
                    "Hiking",
                    "Perfume",
                    "Practical",
                    "Subscriptions",
                    "Wellness",
                    "Yoga",
                    "Wildcard"],
      dropdown: {
        position: "input",
        enabled : 0 // always opens dropdown when input gets focus
      }
    })
  }

  addTag() {
    console.log(this.addHobbyTarget.value)
  }
}
