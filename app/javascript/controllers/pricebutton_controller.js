import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="pricebutton"
export default class extends Controller {

static targets = ["number", "button"]
static values = { price: Number }

  connect() {
    // console.log(this.priceValue)
    // console.log(this.buttonTarget.href)

  }

  updateNumber(event) {
    this.numberTarget.innerText = "999"
    let range = document.querySelector("#temp")
    this.numberTarget.innerText = `Price ${range.value} $`
    let hrefArray = this.buttonTarget.href.split("=")
    console.log(hrefArray);
    hrefArray.pop()
    hrefArray.push(`price=${range.value}`)
    let finalUrl = hrefArray.join("")
    this.buttonTarget.href = finalUrl
  }

  sendRequest(event) {
    // event.preventDefault()
    console.log(this.buttonTarget)
    console.log("fefefefef")
    console.log(this.numberTarget.innerText)

    // fetch request with method PATCH to update the value

    // reload the page
  }

  updateTextInput() {
   // document.getElementById('textInput').value=val;
    // console.log("this is me")
  }

}
