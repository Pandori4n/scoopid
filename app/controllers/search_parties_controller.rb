class SearchPartiesController < ApplicationController
  before_action :search_party_params, only: [:update, :create]

  def index
    @lost_person = current_user.lost_people.last
    @searchparties = policy_scope(SearchParty).where(lost_person: @lost_person)
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
    p search_party_params
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
    # if @search_party.save
    #   redirect_to search_party_path(@search_party)
    # else
    #   render :edit
    # end
  end

  def update
    @search_party = SearchParty.find(params[:id])
    authorize @search_party
    @search_party = SearchParty.update(search_party_params)
    @search_party = @search_party.last
    @search_party.save!
    redirect_to search_party_path(@search_party)
  end

  private

  def search_party_params
    params.require(:search_party).permit(:date, :start_time, :end_time, :meeting_location, :description, :radius)
  end
end
