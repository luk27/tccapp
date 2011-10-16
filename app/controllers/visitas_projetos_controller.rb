class VisitasProjetosController < ApplicationController
before_filter :authenticate
#before_filter :correct_profile
before_filter :profile_projeto

	def index
	@proj = params[:projeto_id]
		@visitas = VisitasProjeto.where(:projeto_id => @proj)
		
		@visitas_atual = 0
		@visitas.each do |v|
			if (v.created_at.month == Date.today.month)
			@visitas_atual += 1
			end
		end
		
		@visitas_mes_ant = 0
		@visitas.each do |v|
			if (v.created_at.month == (Date.today.month - 1))
			@visitas_mes_ant += 1
			end
		end
		
		@visitas_mes_ant2 = 0
		@visitas.each do |v|
			if (v.created_at.month == (Date.today.month - 2))
			@visitas_mes_ant2 += 1
			end
		end
		
		@visitas_mes_ant3 = 0
		@visitas.each do |v|
			if (v.created_at.month == (Date.today.month - 3))
			@visitas_mes_ant3 += 1
			end
		end				
		
		
	end
	
	def classificacao
		@proj = Projeto.find(params[:projeto_id])
		
		@visitas = VisitasProjeto.where(:projeto_id => @proj).count
		if @visitas < 5
			@nota1 = 0
		elsif @visitas >= 5 && @visitas < 20
			@nota1= 1
		elsif @visitas >=20 && @visitas < 50
			@nota1 = 2
		elsif @visitas >=50 && @visitas < 100
			@nota1 = 3
		elsif @visitas >= 100 && @visitas < 200
			@nota1 = 4
		elsif @visitas >= 200
			@nota1 = 5
		end
		
		@membros = Equipe.where(:projeto_id => @proj.id).count
		if @membros < 1
			@nota2 = 0
		elsif @membros >= 1 && @membros < 3
			@nota2= 1
		elsif @membros >=3 && @membros < 5
			@nota2 = 2
		elsif @membros >=5 && @membros < 10
			@nota2 = 3
		elsif @membros >= 10 && @membros < 20
			@nota2 = 4
		elsif @membros >= 20
			@nota2 = 5
		end
		
		@postagens = Postagem.where(:projeto_id => @proj.id).count
		if @postagens < 1
			@nota3 = 0
		elsif @postagens >= 1 && @postagens < 5
			@nota3= 1
		elsif @postagens >=5 && @postagens < 10
			@nota3 = 2
		elsif @postagens >=10 && @postagens < 20
			@nota3 = 3
		elsif @postagens >= 20 && @postagens < 40
			@nota3 = 4
		elsif @postagens >= 40
			@nota3 = 5
		end
		
		@nota4=0
		if @proj.completo < 10
			@nota4 = 0
		elsif @proj.completo >= 10 && @proj.completo < 25
			@nota4= 1
		elsif @proj.completo >=25 && @proj.completo < 50
			@nota4 = 2
		elsif @proj.completo >=50 && @proj.completo < 75
			@nota4 = 3
		elsif @proj.completo >= 75 && @proj.completo < 100
			@nota4 = 4
		elsif @proj.completo == 100
			@nota4 = 5
		end
		
		
		
	
	
	
	
	end

private
	
	def profile_projeto
	@projeto = Projeto.find(params[:projeto_id])
	redirect_to root_path unless @projeto.profile_id == (current_profile.id)
	end

end
