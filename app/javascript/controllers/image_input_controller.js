import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-input"
export default class extends Controller {
  static targets = ["input", "message"]

  connect() {
  }

  addImage() {
    this.inputTarget.click()
  }

  inputChange(){
    this.messageTarget.classList.remove("d-none")
  }
}
