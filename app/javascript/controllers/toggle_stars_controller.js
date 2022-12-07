import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-stars"
export default class extends Controller {
  static targets = ["star"]
  static values = {starToken: String}

  createStar(event) {
    event.preventDefault(event);

    fetch(this.starTarget.href, {
      method: "POST",
      headers: {
        "Accept": "application/text",
        "x-csrf-token": this.starTokenValue
      }
    })
    .then(response => response.text())
    .then((data) => {
      this.element.outerHTML = data
    })
  }

  deleteStar(event) {
    event.preventDefault(event);
    fetch(this.starTarget.href, {
      method: "DELETE",
      headers: {
        "Accept": "application/text",
        "x-csrf-token": this.starTokenValue
      }
    })
    .then(response => response.text())
    .then((data) => {
      this.element.outerHTML = data
    })
  }
}


// import { Controller } from “@hotwired/stimulus”
// // Connects to data-controller=“bookmark”
// export default class extends Controller {
//   change() {
//     const postId = this.element.dataset.postId
//     const scrfToken = this.element.dataset.scrfToken
//     let url = null
//     let method = null
//     if (this.element.classList.contains(“fa-regular”)) {
//       method = “POST”
//       url = `/posts/${postId}/bookmarks`
//     } else {
//       const bookmarkId = this.element.dataset.bookmarkId
//       method = “DELETE”
//       url = `/bookmarks/${bookmarkId}`
//     }
//     fetch(url, {method: method, headers: {“x-csrf-token”: scrfToken}})
//     .then((response) => response.json()).then((bookmark) => {
//       this.element.classList.toggle(“fa-solid”)
//       this.element.classList.toggle(“fa-regular”)
//       if (method == “POST”) {
//         this.element.dataset.bookmarkId = bookmark.id
//       } else {
//         this.element.dataset.bookmarkId = null
//       }
//     })
//   }
// }
