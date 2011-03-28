class CursosController < ApplicationController
before_filter :authenticate, :only => [:new, :create, :destroy]

  def new
@title = `Adicionar Curso`
@curso = Curso.new
  end


  def create
@title = `Adicionar Curso`
    @curso  = current_profile.cursos.build(params[:curso])
    if @curso.save
      flash[:success] = "Curso adicionado com sucesso!"
      redirect_to current_profile
    else
      render curso_path
    end
  end

end
