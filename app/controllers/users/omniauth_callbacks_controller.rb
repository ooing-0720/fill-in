class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_forgery_protection

  def self.provides_callback_for(provider)
    define_method(provider) do
      auth_data = request.env["omniauth.auth"]
      @user = User.find_for_oauth(auth_data, current_user)


      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: provider.to_s.capitalize) if is_navigational_format?
      else
        sesssion["devise.#{provider}_data"] = auth.data
        redirect_to new_user_registration_url
      end
    end
  end

  [ :kakao, :naver, :google_oauth2 ].each do |provider|
    provides_callback_for provider
  end

  def after_sign_in_path_for(resource)
      root_path
  end
end
