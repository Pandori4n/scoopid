class LostPeopleController < ApplicationController
  def new
    @lost_person = LostPerson.new
  end
end
