import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="change-position"
export default class extends Controller {
  static targets = ['card', 'cards', 'camp']

  connect() {
    console.log(this.cardTargets)
  }

  change() {
    this.cardTargets.forEach((card) => {
      if (card.classList.contains('grey')) {
        const carte = card
        this.cardsTarget.insertAdjacentHTML('beforeend', carte.outerHTML)
        card.remove()
      }

    })
  }
}
