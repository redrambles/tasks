import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="removals"
export default class extends Controller {
  remove() {
    console.log("Removing element");
    this.element.remove();
  }
}
