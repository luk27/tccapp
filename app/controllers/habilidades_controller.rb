class HabilidadesController < ApplicationController
before_filter :authenticate, :only => [:new, :create, :destroy]
before_filter :correct_profile, :only => [:new, :edit, :update]#, :destroy]
before_filter :correct_profile_d, :only => [:destroy]
#before_filter :authorized_profile, :only => :destroy
before_filter :get_profile

layout "profiles"

  def new
	@profile = Profile.find(params[:profile_id])
	@habilidade = @profile.habilidades.build
  end

def get_profile
	@profile = Profile.find(params[:id_profile]) if params[:id_profile]

end

def destroy
  @habilidade = Habilidade.find(params[:id])
  @habilidade.destroy
  redirect_to current_profile
end


  def create
	@profile = Profile.find(params[:profile_id])
	@habilidade= @profile.habilidades.build(params[:habilidade])
	if @habilidade.save
	  flash[:success] = "Habilidade adicionado com sucesso!"
	  redirect_to current_profile
	else
	  render habilidade_path
	end
  end


#NOVO CODIGO
	 def correct_profile
	  @profile = Profile.find(params[:profile_id])
	  redirect_to current_profile unless current_profile?(@profile)
	end
#NVO

def correct_profile_d
	  #@profile = Profile.find(params[:id_profile])
	  @profile = Profile.find(current_profile)
	  redirect_to current_profile unless current_profile?(@profile)
	end

 private

	def authorized_profile
	  @habilidade = Habilidade.find(params[:id])
	  redirect_to root_path unless current_profile?(@curso.profile)
	end






end
