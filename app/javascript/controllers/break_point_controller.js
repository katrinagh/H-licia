import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="break-point"
export default class extends Controller {
  static targets = ["toto"];
  scrolling_all(event) {
    console.log("action");
    window.scrollTo(0, 700);
  }

  scrolling_Pain(event) {
    console.log("action");
    window.scrollTo(0, 800);
  }

  scrolling_Digestion(event) {
    console.log("action");
    window.scrollTo(0, 900);
  }

  scrolling_Coolings(event) {
    console.log("action");
    window.scrollTo(0, 1000);
  }

  scrolling_Skin_hair(event) {
    console.log("action");
    window.scrollTo(0, 1100);
  }

  scrolling_eyes(event) {
    console.log("action");
    window.scrollTo(0, 1200);
  }
}
