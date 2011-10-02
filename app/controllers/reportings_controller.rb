class ReportingsController < ApplicationController

	def index
		
	end
	
	def indicadores_projeto
	
	end
	
	
	def membros_projeto
		@projetos_membros = Projeto.membros_por_projeto
		@projetos_membros_15 = 0
		@projetos_membros_10 = 0
		
		@projetos_membros.each do |p|
			if (p.total.to_i >= 1 and p.total.to_i <= 5)
				@projetos_membros_15 = @projetos_membros_15 + 1
			elsif p.total.to_i > 10
				@projetos_membros_10 = @projetos_membros_10 + 1
			end
		end	
		
		@projetos_sem_membros = Projeto.all 

	    @projetos_membros.each do |p|
			@projetos_sem_membros.each do |p2|
				@nome = p.nome
				if (p2.nome == @nome)
					@projetos_sem_membros.delete(p)
				end
			end
		end
	end
	
	def envia_email
		@nome = params[:nome]
		@email = params[:email]
		@metodo = params[:metodo]
		puts "AUHUAHHUAHUAAHUA LOL OLOLOLOLOLOLOLOLOL #@metodo"
		if (@metodo == "1")
			ProfileMailer.alerta_membros(@email, @nome).deliver
		end
		if (@metodo == "2")
			ProfileMailer.alerta_postagens(@email, @nome).deliver
		end
	end
	
	
	def postagens_projeto
		@projetos_mensagens = Projeto.postagems_por_projeto
		@projetos_mensagens_15 = 0
		@projetos_mensagens_10 = 0
		
		@projetos_mensagens.each do |p|
			if (p.total.to_i >= 1 and p.total.to_i <= 5)
				@projetos_mensagens_15 = @projetos_mensagens_15 + 1
			elsif p.total.to_i > 10
				@projetos_mensagens_10 = @projetos_mensagens_10 + 1
			end
		end	
		
		@projetos_sem_mensagens = Projeto.all 

		@projetos_mensagens.each do |p|
			@projetos_sem_mensagens.each do |p2|
				@nome = p.nome
				if (p2.nome == @nome)
					@projetos_sem_mensagens.delete(p)
				end
			end
		end		
				
	end
	
end
