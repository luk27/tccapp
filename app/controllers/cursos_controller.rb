class CursosController < ApplicationController
before_filter :authenticate, :only => [:new, :create, :destroy]
before_filter :correct_profile, :only => [:new, :edit, :update]#, :destroy]
before_filter :correct_profile_d, :only => [:destroy]
#before_filter :authorized_profile, :only => :destroy
before_filter :get_profile



  def new
    @profile = Profile.find(params[:profile_id])
    @curso = @profile.cursos.build
    #respond_with(@curso)
  end

def get_profile
    @profile = Profile.find(params[:id_profile]) if params[:id_profile]
    
end

def destroy
  @profile= Profile.find(params[:id_profile])
  @curso = Curso.find(params[:id_curso])
  @curso.destroy
  redirect_to current_profile
end 

## DESTROY ANTIGO
  #def destroy
  #  @profile= Profile.find(params[:id_profile])
  #  @curso = Curso.find(params[:curso_id])
  #  @curso.destroy
  #  redirect_to current_profile
 # end
## DESTROY ANTIGO

  def create
  #TENTATIVA
    @profile = Profile.find(params[:profile_id])
    @curso= @profile.cursos.build(params[:curso])


   #@curso = current_profile.cursos.build(params[:curso])
    if @curso.save
      flash[:success] = "Curso adicionado com sucesso!"
      redirect_to current_profile
    else
      @feed_items = []
      render curso_path
    end
  end


#NOVO CODIGO
     def correct_profile
      @profile = Profile.find(params[:profile_id])
      redirect_to current_profile unless current_profile?(@profile)
    end
#NVO

def correct_profile_d
      @profile = Profile.find(params[:id_profile])
      redirect_to current_profile unless current_profile?(@profile)
    end

 private

    def authorized_profile
      @curso = Curso.find(params[:id])
      redirect_to root_path unless current_profile?(@curso.profile)
    end

end

