import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="campaign-cancel"
export default class extends Controller {
  static targets = ['card', 'options', 'camp']
  connect() {
  }

  cancel() {
    const url = this.campTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.campTarget)
    })
    this.optionsTarget.classList.toggle('d-none')
    this.cardTarget.classList.add('grey')
  }
}
