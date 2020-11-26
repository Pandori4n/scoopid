class SearchPartyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def index?
    return true
  end

  def show?
    create?
  end

  def create?
    if user.role == "host"
      return true
    end
  end

  def show?
    return true
  end

  def update?
    return true
    # record.user == user
    # - record: the search party passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def new?
    return true
  end

  def destroy?
    return true
    # record.user == user
  end

  def edit
    return true
    # record.user == user
  end

  def update
    return true
    # record.user == user
  end
end
