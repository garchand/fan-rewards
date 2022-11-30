class CampaignsAmbassadorsController < ApplicationController
  def new
    @campaign_ambassador = CampaignAmbassador.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @campaign_ambassador = CampaignAmbassador.new
    @campaign_ambassador.campaign = @campaign
    @campaign_ambassador.user = current_user
    if @campaign_ambassador.save
      redirect_to campaign_ambassador_path(@campaign_ambassador)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
