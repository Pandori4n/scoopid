class LostPeopleController < ApplicationController
  # def index
  #   @restaurants = policy_scope(LostPerson)
  # end

  def new
    @lost_person = LostPerson.new
    authorize @lost_person
  end
end
