class ProjetosController < ApplicationController


 def new
	##@dono = Profile.find(params[:profile_id])
	@projeto = Projeto.new
  end




 def index
	@title = "Todos os Projetos"
	@projetos = Projeto.paginate(:page => params[:page])
  end

def create
##NEW TRY
	##@dono = Profile.find(params[:profile_id])
	##@projeto= @dono.projetos.build(params[:projeto])
	##
	

	@projeto  = current_profile.projetos.build(params[:projeto])
	if @projeto.save
	  flash[:success] = "Projeto Criado!"
	  redirect_to root_path
	else
	  render 'pages/home'
	end
  end






def dono
@profile = Profile.find(params[:id])
end

end
