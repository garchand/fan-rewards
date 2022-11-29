class CampaignsAmbassadorsController < ApplicationController
  def new
    @campaign_ambassador = CampaignAmbassador.new
  end

  def create
    @campaign_ambassador = CampaignAmbassador.new(params_campaign_ambassador)
    @campaign_ambassador.user = current_user
    if @campaign_ambassador.save
      redirect_to campaign_ambassador_path(@campaign_ambassador)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def campaign_ambassador_params
    params.require(:campaign_ambassador).permit(:client_code, :referrals_count, :reward_status, :ambassador_code)
  end
end
