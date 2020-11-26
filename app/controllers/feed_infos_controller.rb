class FeedInfosController < ApplicationController
  def index
    @feed_infos = policy_scope(FeedInfo)
  end
end
