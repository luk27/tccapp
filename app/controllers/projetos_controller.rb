class ProjetosController < ApplicationController







 def index
	@title = "Todos os Projetos"
	@projetos = Projeto.paginate(:page => params[:page])
  end








def dono
@profile = Profile.find(params[:id])
end

end
