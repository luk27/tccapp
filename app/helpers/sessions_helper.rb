module SessionsHelper
  def entrar(profile)
    cookies.permanent.signed[:remember_token] = [profile.id, profile.salt]
    self.current_profile = profile
  end



  def current_profile=(profile)
    @current_profile = profile
  end


 def current_profile
    @current_profile ||= profile_from_remember_token
  end

  def current_profile?(profile)
    profile == current_profile
  end

    def authenticate
      deny_access unless entrar?
    end

  def deny_access
    redirect_to entrar_path, :notice => "Por favor entre no sistema para poder editar seu profile."
  end


  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  def entrar?
    !current_profile.nil?
  end

  def sair
    cookies.delete(:remember_token)
    self.current_profile = nil
  end

  private

    def profile_from_remember_token
      Profile.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def clear_return_to
      session[:return_to] = nil
    end

end
