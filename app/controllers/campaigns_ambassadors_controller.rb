class CampaignsAmbassadorsController < ApplicationController
  require 'rqrcode'

  def new
    @campaign_ambassador = CampaignsAmbassador.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    authorize @campaign
    @campaign_ambassador = CampaignsAmbassador.new
    @campaign_ambassador.campaign = @campaign
    @campaign_ambassador.user = current_user
    if @campaign.restaurant.restaurants_ambassadors.where(user_id: current_user.id).empty?
      RestaurantsAmbassador.create(user: current_user, restaurant: @campaign.restaurant)
    end
    if @campaign_ambassador.save
      redirect_to restaurant_path(@campaign.restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def client_code
    @campaign_ambassador = CampaignsAmbassador.find(params[:campaigns_ambassador_id])
    @campaign = @campaign_ambassador.campaign
    authorize @campaign_ambassador
    if current_user == @campaign_ambassador.campaign.restaurant.user
      @campaign_ambassador.update(referrals_count: @campaign_ambassador.referrals_count += 1)
      if @campaign_ambassador.referrals_count >= @campaign.reward_threshold
        CampaignsAmbassadorChannel.broadcast_to(
          @campaign_ambassador,
          render_to_string(partial: "shared/progress_full", locals: { camp: @campaign_ambassador })
        )
      else
        CampaignsAmbassadorChannel.broadcast_to(
          @campaign_ambassador,
          render_to_string(partial: "shared/progress",
                           locals: { id: @campaign_ambassador.id, count: @campaign_ambassador.referrals_count,
                                     threshold: @campaign.reward_threshold })
        )
      end
      redirect_to restaurant_path(@campaign.restaurant)
    else
      @restaurants = Restaurant.all
      render 'restaurants/index', status: :unprocessable_entity
    end
  end

  def ambassador_code
    @campaign_ambassador = CampaignsAmbassador.find(params[:campaigns_ambassador_id])
    authorize @campaign_ambassador
    if current_user == @campaign_ambassador.campaign.restaurant.user
      if @campaign_ambassador.campaign.reward_threshold == @campaign_ambassador.referrals_count && @campaign_ambassador.reward_status != "used"
        @campaign_ambassador.update(reward_status: "used")
        redirect_to restaurant_path(@campaign_ambassador.campaign.restaurant)
      end
    else
      @restaurants = Restaurant.all
      render 'restaurants/index', status: :unprocessable_entity
    end
  end
end
