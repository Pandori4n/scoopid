class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def end_search_message
  end

  def join_search
    if params[:authentication_token].present?
      search_party = SearchParty.find_by(authentication_token: params[:authentication_token])
      if search_party
        redirect_to lost_person_path(search_party.lost_person)
      else
        flash[:alert] = "Mauvais code"
      end
    end
  end
end

# renvoi sur "singnup or login"
