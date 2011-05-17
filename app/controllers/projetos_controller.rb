class ProjetosController < ApplicationController
 #before_filter :authenticate, :only =>  [:create, :destroy]
 before_filter :authenticate, :only => [:index, :edit, :update, :new, :create] #NEW THING
before_filter :correct_profile, :only => [:edit, :update, :new, :create, :delete, :destroy] #NEW THING
before_filter :profile_projeto, :only => [:edit]

 def new
	@projeto = Projeto.new
  end

 def index
	@title = "Todos os Projetos"
	@projetos = Projeto.paginate(:page => params[:page])
  end

def create
	@projeto  = current_profile.projetos.build(params[:projeto])
	if @projeto.save
	  flash[:success] = "Projeto Criado!"
	  redirect_to @projeto
	else
	  render 'new'
	end
  end

  def show
	@projeto = Projeto.find(params[:id])
	@title = @projeto.nome
end

def destroy
  #@profile= Profile.find(params[:id_profile])
  @projeto = Projeto.find(params[:id])
  @projeto.destroy
  redirect_to "/projetos"
end 

  def edit
    @projeto = Projeto.find(params[:id])
	@title = "Editar Projeto"
  end

def update
	@projeto = Projeto.find(params[:id])
	if @projeto.update_attributes(params[:projeto])
	  flash[:success] = "Projeto Atualizado."
	  redirect_to @projeto
	else
	  @title = "Editar Projeto"
	  render 'edit'
	end
  end


####


 private

## NOVO qualquer coisa ranca fora
	def correct_profile
	  @profile = current_profile
	  redirect_to(root_path) unless current_profile?(@profile)
	end
	
	def profile_projeto
	@projeto = Projeto.find(params[:id])
	redirect_to root_path unless profile_projeto?(@profile)
	end

end
