class CursosController < ApplicationController
before_filter :authenticate, :only => [:new, :create, :destroy]
before_filter :correct_profile, :only => [:new, :edit, :update]


## REMOVENDO CODIGO
 def new
@title = `Adicionar Curso`
@curso = Curso.new
  end



## NOVO CODIGO



<<<<<<< HEAD
    
## NOVO CODIGO    
=======

## NOVO CODIGO
>>>>>>> Visualizar



  def create
  #TENTATIVA
<<<<<<< HEAD
  
    #@title = `Adicionar Curso`
    @curso  = current_profile.cursos.build(params[:curso])
=======

    #@title = `Adicionar Curso`
    @curso = current_profile.cursos.build(params[:curso])
>>>>>>> Visualizar
    if @curso.save
      flash[:success] = "Curso adicionado com sucesso!"
      redirect_to current_profile
    else
      render curso_path
    end
  end


#NOVO CODIGO
     def correct_profile
      @profile = Profile.find(params[:id_profile])
      redirect_to current_profile unless current_profile?(@profile)
    end
#NVO

end

