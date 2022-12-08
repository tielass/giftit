import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static targets = ["remove", "card"]
  connect() {
    console.log("Connected");
    this.channel = createConsumer().subscriptions.create(
      { channel: "GiftsChannel", id: this.giftsIdValue },
      { received: data => this.#ScrollDown(data) }
    )
    console.log(`Log: ${this.giftsIdValue}.`)
  }

  removegifts(event) {
    console.log("Removing..");
    event.preventDefault();
    event.currentTarget.remove();
    }

    #ScrollDown(data) {
      console.log("Scrolling down");
      this.removeTarget.scrollTo(0, this.removeTarget.scrollHeight)
    }
}
