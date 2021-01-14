class SearchController < ApplicationController
  def index
    if params[:query].present?
      @lost_person = LostPerson.search(params[:query])
      redirect_to lost_person_path(@lost_person)
    else
      "Veuillez réessayer"
    end
    # if params[:query].present?
    #   @lost_person_code = LostPerson.search_by_code(params[:query])
    #     if params[:query] === @lost_person_code
    #       redirect_to lost_person_path(@lost_person)
    #     else
    #       "Mauvais code, veuillez réessayer"
    #     end
    # elsif
    #   @lost_person_location = LostPerson.search_by_location(params[:query])
    #     if params[:query] === @lost_person_location
    #       redirect_to lost_person_path(@lost_person)
    #     else
    #       "Veuillez entrer une ville"
    #     end
    # else
    #   @lost_person_name = LostPerson.search_by_full_name(params[:query])
    #     if params[:query] === @lost_person_name
    #       redirect_to lost_person_path(@lost_person)
    #     else
    #       "Veuillez entrer un nom ou un prénom"
    #     end
    # end
  end
end
