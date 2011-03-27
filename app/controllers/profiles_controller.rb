class ProfilesController < ApplicationController
  def novo
@title = `Cadastrar`
  end

  def show
    @profile = Profile.find(params[:id])
  end

end
