class ProjetosController < ApplicationController
 #before_filter :authenticate, :only =>  [:create, :destroy]


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
	  redirect_to root_path
	else
	  render 'pages/home'
	end
  end


  def show
	@projeto = Projeto.find(params[:id])
	##@dono= Profile.find(params[:profile_id])
	@title = @projeto.nome
end

#def dono
#@profile = Profile.find(params[:id])
#end




end
