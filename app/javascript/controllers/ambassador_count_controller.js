import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="ambassador-count"
export default class extends Controller {
  static values = { campaignId: Number }
  static targets = ["count", "cardProgress"]
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "CampaignsAmbassadorChannel", id: this.campaignIdValue },
      {
        received: data => this.cardProgressTarget.outerHTML = data
      }
    )
    console.log("localhost:3000/campaigns_ambassadors/" + this.campaignIdValue + "/client_code");
  }
  disconnect() {
    console.log("Unsubscribed from the campaign ambassador")
    this.channel.unsubscribe()
  }
}

// localhost:3000/campaigns_ambassadors/25/client_code
