class CampaignsAmbassadorChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    campaign_ambassador = CampaignsAmbassador.find(params[:id])
    stream_for campaign_ambassador
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
