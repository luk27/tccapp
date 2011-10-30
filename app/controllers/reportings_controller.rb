class ReportingsController < ApplicationController
skip_before_filter :add_visita
before_filter :admin?

layout "painel"

	def index
		
	end
	
	def indicadores_projeto
	
	end
	
	def indicadores_sistema
		@projetos = Projeto.all
		
		@mensagens = Message.all
		
		@profiles = Profile.all
		
		@avaliacoes = Avaliacao.all
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
	
	def visitas
		
		@visitas = Visita.all
		
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

	def admin?
		unless current_profile.admin == true
		redirect_to :root
		end
	end	
	
end
