class LostPersonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
     record.user == user
  end

  def show?
    return true
  end

  def create?
    return true
  end

  # def destroy?
  #   record.user == user
  # end

  def create?
    return true
  end
end
