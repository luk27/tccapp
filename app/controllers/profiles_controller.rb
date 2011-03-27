class ProfilesController < ApplicationController
  def novo
@title = `Cadastrar`
@profile = Profile.new
  end

  def show
    @profile = Profile.find(params[:id])
    @title = @profile.nome
  end

  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      flash[:success] = "Login efetuado com sucesso! :)"
        redirect_to @profile
    else
      @title = "Cadastrar"
      render 'novo'
    end
  end

end
