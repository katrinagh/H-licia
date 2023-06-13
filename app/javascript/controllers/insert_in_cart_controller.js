import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-cart"
export default class extends Controller {
  static targets = ["items", "form"]
  connect() {
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  }

  // functions 

  send(event) {
    event.preventDefault()
    const url = this.formTarget.action
    const options = {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
      body: new FormData(this.formTarget)
    }
    fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
