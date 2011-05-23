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
	@projeto  = current_profile.dono_projetos.build(params[:projeto])
	if @projeto.save
	  flash[:success] = "Projeto Criado!"
	  redirect_to @projeto
	else
	  render 'new'
	end
  end

  def show
    @postagem = Postagem.new ## COISA NOVA DA POSTAGEM
	@projeto = Projeto.find(params[:id])
	#@equipe = Equipe.find.where(:projeto_id => params[:id])
	@title = @projeto.nome
	#@profile = Profile.find(params[:id])
	@profile = Profile.find(@projeto.profile_id)
	#FUNCIONA ESSE EM#
	#FUNFANDO MEU @pedido_projeto = @projeto.equipes.pedido.where(:projeto_id => @projeto.id)
	@pedido_projeto = @profile.participacao_equipes.find_all_by_status(false,:include => [:projeto, :membro])
	@pedido_aceito = @profile.participacao_equipes.find_all_by_status(true,:include => [:projeto, :membro])
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
##TENTATIVA SUICIDA####
#def create_membership
 # @projeto = Projeto.find params[:id]
 # if @projeto.equipes.create( :member_id => params[:member_id])
#	redirect_to @projeto
 # else
#	 render :action => 'show'
 # end

#end


####TENTATIVA SUICIDA####
##<%= form_for :projeto, @projeto, :url => { :action => "create_membership" } do |f| %>
##<%= submit_tag "Create" %>
##<% end %>
##<% form_for(:equipe, :url => { :action => "create", :membro_id => @profile.id, :projeto_id => @projeto.id}) do |f| %>
##<% form_for(:equipe, :url => equipes_path(:membro_id => current_profile.id, :projeto_id => @projeto.id)) do |f| %>


##<% for equipe in @profile.equipes %>
##<% if equipe.membro_id == @profile.id %>

##<% for equipe in @profile.equipes %>
##<% if equipe.projeto_id == projeto.id %>
##<%=h equipe.membro_id %> 

#<%=h @profile.nome.where(:id => :membro_id) %>

# <h5>
#Teste:

#<% @pedido_projeto.each do |agm| %>
#  <p> 
#	  Requester: <%= agm.membro.nome %>, 
#	  Group: <%=agm.projeto.nome%> 
 # </p>
#<%end %>
#<HR>


#</h5>

#<% for projeto in @profile.projetos %>

#<%=link_to("Aew manolo", equipe_path(agm, :status => true), :method => :put, :confirm => "Tas louco?")%>

#	<% for equipe in @pedido_projeto %>
#	<%=link_to("Aew manolo", equipe.update_attribute(:status,true))%>
	#<%end %>
	
#<% @projeto.profiles.each do |m| %>

#<% for m in @projeto.profiles %>
#<%= link_to m.nome, m %> - 
#<%end %>
	
	
#<font size = 4>
#Membros do Projeto:

#</font size = 4>
#<HR>


# <% form_for(:postagem, :url => projeto_postagem_path(:profile_id => current_profile.id, :projeto_id => @projeto.id)) do |f| %>

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
