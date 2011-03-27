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
end
