class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true if record.chatroom.volunteer == user || record.chatroom.host == user
  end
end
