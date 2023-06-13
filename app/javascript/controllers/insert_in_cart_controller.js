import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-cart"
export default class extends Controller {
  static targets = ["items", "form", "total"]
  static values = {
    index: String
  }
  connect() {
    // const testValue = this.indexValue
    // console.log(testValue)
    // console.log(this.element)
    // console.log(this.formTarget)
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  }

  // functions 

  send(event) {
    event.preventDefault()
    // const totalContent = this.totalTargets[event.params.id]
    // console.log('test 12', this.totalTargets[event.params.id])
    console.log('hello')
    // totalContent.textContent = "200"
    // console.log('test 17', event.target)
    // console.log('test 18', event.target.id)

    // console.log('target event 5', event.currentTarget)

    // const url = this.formTarget.action
    // const options = {
    //   method: "POST",
    //   headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
    //   body: new FormData(this.formTarget)
    // }
    // fetch(url, options)
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data)
    //   })
  }
}
