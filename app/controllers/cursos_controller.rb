class CursosController < ApplicationController
before_filter :authenticate, :only => [:new, :create, :destroy]
before_filter :correct_profile, :only => [:new, :edit, :update, :destroy]
#before_filter :authorized_profile, :only => :destroy

## REMOVENDO CODIGO
 def new
@title = `Adicionar Curso`
@curso = Curso.new
  end



## NOVO CODIGO
  def destroy
    @curso.destroy
    redirect_to current_profile
  end

 



## NOVO CODIGO



  def create
  #TENTATIVA

    #@title = `Adicionar Curso`
    @curso = current_profile.cursos.build(params[:curso])
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
      @profile = Profile.find(params[:id_profile])
      redirect_to current_profile unless current_profile?(@profile)
    end
#NVO


 private

    def authorized_profile
      @curso = Curso.find(params[:id])
      redirect_to root_path unless current_profile?(@curso.profile)
    end

end

