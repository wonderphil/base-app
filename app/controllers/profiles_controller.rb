class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    if @user == current_user
      render 'profiles/show'
    else
      flash[:danger] = "You can only view/edit your own profile!"
      redirect_to(root_url)
    end
  end

  def update

  end
end
