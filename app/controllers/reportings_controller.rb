class ReportingsController < ApplicationController

	def index
		@projetos_mensagens = Projeto.postagems_por_projeto
		@projetos_mensagens_15 = 0
		@projetos_mensagens_10 = 0
		
		
		@projetos_membros = Projeto.membros_por_projeto
		@projetos_membros_15 = 0
		@projetos_membros_10 = 0
		
		
	    @projetos_mensagens.each do |p|
			if (p.total.to_i >= 1 and p.total.to_i <= 5)
				@projetos_mensagens_15 = @projetos_mensagens_15 + 1
			elsif p.total.to_i > 10
				@projetos_mensagens_10 = @projetos_mensagens_10 + 1
			end
		end
		@projetos_membros.each do |p|
			if (p.total.to_i >= 1 and p.total.to_i <= 5)
				@projetos_membros_15 = @projetos_membros_15 + 1
			elsif p.total.to_i > 10
				@projetos_membros_10 = @projetos_membros_10 + 1
			end
		end
	end
end
