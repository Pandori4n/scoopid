class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def index
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.new
    @lost_person = LostPerson.find(params[:lost_person_id])
  end

  def create
    @chatroom = Chatroom.new(chatrooms_param)
    authorize @chatroom
    @lost_person = LostPerson.find(params[:lost_person_id])
    @chatroom.lost_person = @lost_person
    @chatroom.host = current_user
    @chatroom.save
    redirect_to lost_person_chatroom_path(@lost_person, @chatroom)
  end

  private

  def chatrooms_param
    params.require(:chatroom).permit(:volunteer_id)
  end
end
