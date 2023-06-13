import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="order-subscription"
export default class extends Controller {
  static values = { orderId: Number }
  static targets = ["markers"]

  connect() {
    console.log(`Subscribe to the chatroom with the id ${this.orderIdValue}.`)
  }
}
