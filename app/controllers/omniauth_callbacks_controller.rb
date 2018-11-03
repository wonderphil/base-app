class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # alias_method :facebook, :do_omniauth
  # alias_method :google, :do_omniauth
  # alias_method :amazon, :do_omniauth
  # alias_method :twitter, :do_omniauth

  def amazon
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

    if @user.persisted?
      # This will throw if @user is not activated
      sign_in_and_redirect @user, :event => :authentication
      if is_navigational_format?
        set_flash_message(:notice, :success, :kind => provider_kind)
      end
    else
      redirect_to new_user_registration_url
    end

  end

end