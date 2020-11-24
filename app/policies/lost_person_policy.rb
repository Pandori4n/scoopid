class LostPersonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
     record.user == user
  #   # - record: the lost person passed to the `authorize` method in controller
  #   # - user:   the `current_user` signed in with Devise.
   end

  # def destroy?
  #   record.user == user
  # end

  def create?
    return true
  end
end
