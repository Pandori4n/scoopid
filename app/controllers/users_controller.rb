class UsersController < ApplicationController
  def update
    current_user.update(role: params[:role])
    if params[:role] == 'host'
      redirect_to new_lost_person_path
    elsif params[:role] == 'volunteer'
      redirect_to root_path
    end
  end
end
