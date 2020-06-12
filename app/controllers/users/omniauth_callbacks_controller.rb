class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Github') if is_navigational_format?
    else
      session['devise.github_data'] = request.env['omniauth.auth'].except('extra')
      if is_navigational_format?
        set_flash_message(:notice, :failure, kind: 'Github', reason: 'this email already has already been used')
      end
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      session['devise.google_oauth2_data'] = request.env['omniauth.auth'].except('extra')
      if is_navigational_format?
        set_flash_message(:notice, :failure, kind: 'Google', reason: 'this email already has already been used')
      end
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end