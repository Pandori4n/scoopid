class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
    @feed_info = FeedInfo.new
  end

  def index
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.new
    @lost_person = LostPerson.find(params[:lost_person_id])
  end

  def create
    @lost_person = LostPerson.find(params[:lost_person_id])
    if Chatroom.find_by(volunteer_id: params[:chatroom][:volunteer_id].to_i, lost_person: @lost_person)
      @chatroom = Chatroom.find_by(volunteer_id: params[:chatroom][:volunteer_id].to_i, lost_person: @lost_person)
      authorize @chatroom
      redirect_to lost_person_chatroom_path(@lost_person, @chatroom)
    else
      @chatroom = Chatroom.new(chatrooms_param)
      authorize @chatroom
      @chatroom.lost_person = @lost_person
      @chatroom.host = current_user
      @chatroom.save
      redirect_to lost_person_chatroom_path(@lost_person, @chatroom)
    end
  end

  private

  def chatrooms_param
    params.require(:chatroom).permit(:volunteer_id)
  end
end
