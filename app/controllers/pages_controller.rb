class PagesController < ApplicationController
  require 'date'

  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def stats
    @restaurant = Restaurant.find(restaurants_params)

    @ambassadors = User.all
    @restaurants = Restaurant.all
    @restaurants_ambassadors = RestaurantsAmbassador.all
    @campaigns = Campaign.all
    @campaigns_ambassadors = CampaignsAmbassador.all
    @current_restaurant = Restaurant.find(restaurants_params)

    @restaurant_current_ambassadors = @restaurants_ambassadors.where(restaurant_id: @current_restaurant)
    @number_of_ambassadors = @restaurant_current_ambassadors.count

    date0 = Date.today-30
    @number_of_new_ambassadors_over_the_last_30_days = @restaurants_ambassadors.where("created_at >= :date OR updated_at >= :date", date: date0).count

    @campaigns_of_the_restaurant = @campaigns.where(restaurant_id: @current_restaurant.id)
    number_of_ambassadors_active = CampaignsAmbassador.where(campaigns: @campaigns_of_the_restaurant).count

    if @number_of_ambassadors.to_f == 0
      @percentage_active = "NA"
    else
      @percentage_active = (number_of_ambassadors_active.to_f / @number_of_ambassadors.to_f * 100).round(0).to_s + "%"
    end

    @number_of_referrals = CampaignsAmbassador.where(campaigns: @campaigns_of_the_restaurant).sum(:referrals_count)

    @number_of_rewards_used = CampaignsAmbassador.where(campaigns: @campaigns_of_the_restaurant).where(reward_status: "used").count

    @cumulated_number_of_ambassadors = @restaurant_current_ambassadors.group_by_month(:created_at).count

    @result_cumulated_number_of_ambassadors = {}
    keys = []
    @cumulated_number_of_ambassadors.each_with_index do |(key, value), index|
      keys << key
      @result_cumulated_number_of_ambassadors[key] = @cumulated_number_of_ambassadors.values_at(*keys).sum
    end

    raise

  end

  private

  def restaurants_params
    params.require(:restaurant_id)
  end
end
