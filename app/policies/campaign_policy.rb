class CampaignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user:)
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
end
