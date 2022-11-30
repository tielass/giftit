import { Controller } from "@hotwired/stimulus"
import Tagify from '@yaireo/tagify'

// Connects to data-controller="add-hobby"
export default class extends Controller {
  static targets = ["addHobby"]
  connect() {
    console.log('connected')
    new Tagify(this.addHobbyTarget)
  }

  addTag() {
    console.log(this.addHobbyTarget.value)
  }
}
