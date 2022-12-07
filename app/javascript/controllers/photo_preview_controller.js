import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "img"]
  connect() {
    console.log(this.inputTarget, this.imgTarget)
  }

  change() {
    if (this.inputTarget.files && this.inputTarget.files[0]) {
      var reader = new FileReader();
      const outscope = this.imgTarget
      reader.onload = function (e) {
        outscope.setAttribute("src", e.target.result)
        outscope.style.width = "150px"
        outscope.style.height = "200px"
      };

      reader.readAsDataURL(this.inputTarget.files[0]);
    }
  }
}
