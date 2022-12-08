import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="image-input"
export default class extends Controller {
  static targets = ["input", "message", "background"]

  connect() {
  }

  addImage() {
    this.inputTarget.click()
  }

  inputChange() {
    this.messageTarget.classList.remove("d-none")

    this.backgroundTarget.style.backgroundImage = "url(" + URL.createObjectURL(this.inputTarget.files[0]) + ")"
  }
}
