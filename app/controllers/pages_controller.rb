class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def stats
    @ambassadors = User.find(5).restaurants_ambassadors
  end
end
