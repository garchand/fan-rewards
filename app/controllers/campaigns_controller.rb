class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[show destroy update]
  before_action :set_restaurant, only: %i[new create]

  def show
    authorize @campaign
  end

  def new
    @campaign = Campaign.new
    authorize @campaign if current_user.restaurant_ids.include?(params[:restaurant_id].to_i)
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.restaurant = @restaurant
    authorize @campaign
    if @campaign.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @campaign
    @campaign.update(active: "false")
    respond_to do |format|
      format.html { redirect_to restaurants_path }
      format.text { head :ok }
    end
  end

  def destroy
    authorize @campaign
    @campaign.destroy
    redirect_to campaigns_path, status: :see_other
  end

  private

  def campaign_params
    params.require(:campaign).permit(:description, :client_benefit, :ambassador_reward, :start_date, :end_date,
                                     :reward_threshold, :active, :photo)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end
end
