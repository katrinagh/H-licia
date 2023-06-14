import { Controller } from "@hotwired/stimulus"

let quantity = -1

// Connects to data-controller="insert-in-cart"
export default class extends Controller {
  static targets = ["items", "form", "total", "endtotal"]

  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  }

  // functions 
  send(event) {
    let endTotal = 0
    const totalContent = this.totalTargets[event.params.id]
    if (quantity == -1) {
      quantity = event.params.num
    }
    let price = document.getElementById('price' + event.params.id)
    totalContent.textContent = (quantity * parseFloat(price.textContent.split(" CHF")[0])).toFixed(2)

    this.totalTargets.forEach(total => {
      endTotal = parseFloat(total.textContent) + endTotal
    });
    // console.log(endTotal)
    this.endtotalTarget.textContent = endTotal.toFixed(2)
  }

  retrieveQuantity(event) {
    quantity = event.target.value
  }
}