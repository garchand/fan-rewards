class CampaignsAmbassadorPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def client_code?
    true
  end

  def ambassador_code?
    true
  end
end
