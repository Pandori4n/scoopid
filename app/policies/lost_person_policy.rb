class LostPersonPolicy < ApplicationPolicy
  def index?
    return true
  end

  def update?
    record.user == user
  end

  def create?
    return true
  end

  def show?
    return true
  end
end
