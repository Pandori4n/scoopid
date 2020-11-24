class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end
end

# renvoi sur "singnup or login"
