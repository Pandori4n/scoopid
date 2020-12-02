class LostPeopleController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    # @restaurants = policy_scope(LostPerson)
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
    @lost_person = LostPerson.find(params[:id])
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
    params.require(:lost_person).permit(:first_name, :last_name, :age, :last_known_location, :last_known_clothes,
                                        :height, :body_type, :description, :disparition_date_time, :photo)
  end
end
