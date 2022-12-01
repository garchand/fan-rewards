class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

  end

  def stats
    @ambassadors = User.find(6).restaurants_ambassadors
  end
end
