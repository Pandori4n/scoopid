class SearchPartyAttendanciesController < ApplicationController
  #before_action :set_chatroom

  def index
    @search_party = SearchParty.find(params[:search_party_id])
    authorize @search_party
    @search_party_attendancies = policy_scope(@search_party.search_party_attendancies)
    @markers = {
      lat: @search_party.latitude,
      lng: @search_party.longitude,
      image_url: helpers.asset_url('Icone_map_pimp.png')
    }
    @colors = @search_party_attendancies.where.not(itinerary: nil).map do |search_party_attendancy|
      search_party_attendancy.color
    end
    @itineraries = @search_party.search_party_attendancies.where.not(itinerary: nil).map do |search_party_attendancy|
      search_party_attendancy.itinerary
    end
  end

  def show
    @search_party_attendancy = SearchPartyAttendancy.find(params[:id])
    @chatroom = Chatroom.find_or_create_by(volunteer: @search_party_attendancy.user,
      host: current_user, lost_person: @search_party_attendancy.search_party.lost_person)
    authorize @search_party_attendancy
    @search_party = @search_party_attendancy.search_party
    @markers = {
      lat: @search_party.latitude,
      lng: @search_party.longitude,
      image_url: helpers.asset_url('Icone_map_pimp.png')
    }
    @color = @search_party_attendancy.color
    @itinerary = @search_party_attendancy.itinerary
  end

  def create
    @search_party_attendancy = SearchPartyAttendancy.new
    @search_party = SearchParty.find(params[:search_party_id])
    @search_party_attendancy.search_party = @search_party
    @search_party_attendancy.user = current_user
    @search_party_attendancy.save
    redirect_to search_parties_path(@search_party)
    authorize @search_party_attendancy
  end

  def update
    @search_party_attendancy = SearchPartyAttendancy.find(params[:id])
    @search_party_attendancy.update
    redirect_to search_party_path(@search_party)
    authorize @search_party_attendancy
  end

  private

  def set_chatroom
    @search_party_attendancy = SearchPartyAttendancy.find(params[:id])
    @chatroom = Chatroom.find_or_create_by(volunteer: @search_party_attendancy.user,
      host: current_user, lost_person: @search_party_attendancy.search_party.lost_person)
  end
end
