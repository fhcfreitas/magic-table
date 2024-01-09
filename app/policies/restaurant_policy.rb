class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all == Restaurant.all
      scope.all
      # SELECT * FROM restaurants WHERE user_id = 2
      # scope.where(user_id: 2)
      # scope.where(user: user) # if user can only see their restaurants
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def new?
    create?
  end

  def create?
    true
  end

  def edit?
    update?
  end

  def update?
    record.user == user
    # record: the restaurant passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    record.user == user
  end
end
