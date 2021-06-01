class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # Restaurant.all
      # scope.where(user: user) # Restaurant.where(user: user)
    end
  end

  # def new?
  #   true
  # end

  def create?
    true
  end

  def show?
    true
  end

  # def edit?
  #   # user = current_user
  #   # record = argument of method authorize
  #   # if record.user == user
  #   #   true
  #   # else
  #   #   false
  #   # end
  #   record.user == user
  # end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
