class SearchPartyAttendenciesController < ApplicationController
  def index
    @search_party = SearchParty.find(params[:search_party_id])
    authorize @search_party
    @search_party_attendencies = policy_scope(@search_party.search_party_attendancies)

    @marker = {
      lat: @search_party.latitude,
      lng: @search_party.longitude
    }

    @itineraries = @search_party.search_party_attendancies.where.not(itinerary: nil).map do |search_party_attendancy|
      search_party_attendancy.itinerary
    end
  end

  def show
    @search_party_attendancy = SearchPartyAttendancy.find(params[:id])
    authorize @search_party_attendancy
    @search_party = SearchParty.find(params[:search_party_id])
    authorize @search_party
    @search_party_attendencies = policy_scope(@search_party.search_party_attendancies)

    @start_marker = {
      lat: @search_party.latitude,
      lng: @search_party.longitude
    }

    # Set un timer
    # Réception ping ttes 30s des coordonnées
    # Récup données et les sauvegarder
    # Associer le timer et les données
    # Les envoyer vers la view (show) et les afficher
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
end
