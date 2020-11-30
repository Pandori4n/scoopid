class UsersController < ApplicationController
  def profile
    skip_authorization
  end

  def todo
    skip_authorization
  end

  def update
    @user = current_user
    authorize @user
    @user.update(role: params[:role])
    if params[:role] == 'host'
      redirect_to new_lost_person_path
    elsif params[:role] == 'volunteer'
      redirect_to root_path
    end
  end

  def end_search
    @user = current_user
    authorize @user
    if current_user.role == 'host'
      current_user.update(role: 'nil')
      current_user.lost_people.destroy
    end
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:role, :phone_number, :email, :first_name, :last_name, :password)
  end
end
