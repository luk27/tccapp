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

private
	
	def profile_projeto
	@projeto = Projeto.find(params[:projeto_id])
	redirect_to root_path unless @projeto.profile_id == (current_profile.id)
	end

end
