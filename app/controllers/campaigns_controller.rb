class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[show destroy]

  def index
    @campaign = campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(params_campaign)
    @campaign.user = current_user
    if @campaign.save
      redirect_to campaign_path(@campaign)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    @campaign.destroy
    redirect_to campaigns_path, status: :see_other
  end

  private

  def campaign_params
    params.require(:campaign).permit(:description, :client_benefit, :ambassador_reward, :start_date, :end_date,
                                      :reward_threshold, :active)
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end
end
