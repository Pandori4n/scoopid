class FeedInfosController < ApplicationController
  def index
    @feed_infos = policy_scope(FeedInfo)
    @feedinfo = FeedInfo.new
    @lost_person = LostPerson.find(params[:lost_person_id])
  end

  def create
    @feedinfo = FeedInfo.new(feed_infos_param)
    authorize @feedinfo
    @lost_person = LostPerson.find(params[:lost_person_id])
    @feedinfo.lost_person = @lost_person
    @feedinfo.user = current_user
    @feedinfo.save
    redirect_to lost_person_feed_infos_path(@lost_person, @feedinfo)
  end

  private

  def feed_infos_param
    params.require(:feed_info).permit(:title, :description, :user_id, :lost_person_id)
  end
end
