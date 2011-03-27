class SessionsController < ApplicationController
  def new
    @title = "Entrar"
  end

def create
    profile = Profile.authenticate(params[:session][:email],
                             params[:session][:password])
    if profile.nil?
      flash.now[:error] = "Ops! Cadastro incorreto, tente novamente por favor."
      @title = "Entrar"
      render 'new'
    else
      entrar profile
      redirect_to profile
      flash[:success] = "Login efetuado com sucesso! :)"
    end
  end

  def destroy
    sair
    redirect_to root_path
  end

end
