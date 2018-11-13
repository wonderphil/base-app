class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def amazon
    do_omniauth
  end

  def google
    do_omniauth
  end

  def twitter
    do_omniauth
  end

  def facebook
    do_omniauth
  end

  def failure
    redirect_to root_path
  end

  

  private

  # It provides central callback for OmniAuth
  def do_omniauth
    
    @user = User.from_omniauth(request.env['omniauth.auth'])
    provider_kind = @user.provider.capitalize
    @old_user = User.find_by_email(@user.email)

    if @user.persisted?
      # This will throw if @user is not activated
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, kind: provider_kind)
    elsif @old_user.provider != @user.provider
      set_flash_message(:notice, :exists, kind_old: @old_user.provider, kind_new: provider_kind)
      redirect_to new_user_session_path
    else
      set_flash_message(:notice, :failure, kind: provider_kind, reason: "Something went wrong, please try again with different account!")
      redirect_to new_user_registration_url
    end
  end

end