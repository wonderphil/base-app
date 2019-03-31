class ProfilesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :update
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @score = profile_complete
    if @user != current_user
      flash[:danger] = "You can only view/edit your own profile!"
      redirect_to(root_url)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      bypass_sign_in(@user)
      flash[:success] = "Profile updated"
      redirect_to profile_path(@user)
    else
      render 'show'
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :tz, :name, :email, :location)
  end

  def profile_complete
    score = 0
    if @user.tz.nil?
      score += 1
    end
    if @user.location.nil? || @user.location.blank?
      score += 1
    end
    score
  end


end
