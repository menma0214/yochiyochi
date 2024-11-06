import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-reset"
export default class extends Controller {
// app/javascript/controllers/form_reset_controller.js
  reset() {
    this.element.reset();
  }
}

