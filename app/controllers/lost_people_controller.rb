class LostPeopleController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @lost_person = policy_scope(LostPerson).find_by_code(params[:query])
      redirect_to lost_person_path(@lost_person.code) if @lost_person.present?

      @lost_people_with_name = policy_scope(LostPerson).search_by_full_name(params[:query])
      @lost_people_by_location = policy_scope(LostPerson).search_by_location(params[:query])
    else
      @lost_people = policy_scope(LostPerson).all
    end
  end

  def new
    @lost_person = LostPerson.new
    authorize @lost_person
  end

  def create
    @lost_person = LostPerson.new(lost_person_params)
    authorize @lost_person
    @lost_person.user = current_user
    if @lost_person.save
      redirect_to lost_person_path(@lost_person)
    else
      render :new
    end
  end

  def show
    @lost_person = LostPerson.find_by_code(params[:code])
    authorize @lost_person
  end

  def edit
    @lost_person = LostPerson.find(params[:id])
    authorize @lost_person
  end

  def update
    @lost_person = LostPerson.find(params[:id])
    authorize @lost_person
    @lost_person.update(lost_person_params)
    redirect_to lost_person_path(@lost_person)
  end

  def destroy
    @lost_person = LostPerson.find(params[:id])
    authorize @lost_person
    @lost_person.destroy
    redirect_to root_path
  end

  private

  def lost_person_params
    params.permit(:first_name, :last_name, :age, :last_known_location, :last_known_clothes,
                                        :height, :body_type, :description, :disparition_date_time, :photo, :code)
  end
end
