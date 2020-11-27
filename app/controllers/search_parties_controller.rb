class SearchPartiesController < ApplicationController

  def index
    @searchparties = policy_scope(SearchParty)
  end

  def show
    @search_party = SearchParty.find(params[:id])
    authorize @search_party
  end

  def new
    @search_party = SearchParty.new
    authorize @search_party
  end

  def create
    @search_party = SearchParty.new(search_party_params)
    authorize @search_party
    @search_party.lost_person = current_user.lost_people.first
    # @search_party.user = current_user
    if @search_party.save
      redirect_to search_party_path(@search_party)
    else
      render :new
    end
  end

  def edit
    @search_party = SearchParty.find(params[:id])
    authorize @search_party
  end

  def update
    authorize @search_party
  end

  private

  def search_party_params
    params.require(:search_party).permit(:start_date_time, :end_date_time, :meeting_location, :description, :radius)
  end
end
