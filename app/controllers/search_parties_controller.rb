class SearchPartiesController < ApplicationController

  # def index
  #   @searchparties = policy_scope(SearchParty)
  # end

  def new
    authorize @search_party
    @search_party = SearchParty.new
  end

  def create
    authorize @search_party
    @search_party = SearchParty.new(search_party_params)
    @search_party.save 
    redirect_to search_party_path(search_party)
  end

  # def edit
  #   authorize @search_party
  # end

  # def update
  #   authorize @search_party
  # end

  # def destroy
  #   authorize @search_party
  #   @search_party = SearchParty.find(params[:id])
  #   @search_party.destroy
  #   redirect_to lost_people_path
  # end

  private

  def search_party_params
    params.require(:search_party).permit(:start_date_time, :end_date_time, :meeting_location, :description, :radius)
  end
end
