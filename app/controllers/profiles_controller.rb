class ProfilesController < ApplicationController
 before_filter :authenticate, :only => [:index, :edit, :update]
 before_filter :correct_profile, :only => [:edit, :update]
 before_filter :admin_profile, :only => :destroy

  def novo
@title = `Cadastrar`
@profile = Profile.new
  end

  def index
    @title = "Todos os Membros"
    @search = Profile.search do
        fulltext params[:search],
    end
    @profiles = @search.results#.paginate(:page => params[:page])#, :order => "nome")
    #@profiles = Profile.paginate(:page => params[:page])
    
    #@search = Profile.search(params[:search]) #paradinhas nova da busca
    #@profilesS = @search.all  #paradinhas nova da busca
  end

  def ranking
    #@profiles = Profile.total_notas#.order("avaliacaos")
    
    #render 'index'
    #@profiles = Profile.paginate(:page => params[:page])
  end

  def show
    @profile = Profile.find(params[:id])
    @title = @profile.nome
    @feed_items = @profile.feed.paginate(:page => params[:page])
    @pedido_equipe = @profile.equipes.find_all_by_status(true) ##antes era.projetos eh do kara da net isso
    @avaliacaos = @profile.avaliacaos.paginate(:page => params[:page], :per_page => Avaliacao.per_page)
    @avaliadores = @profile.avaliadores
    
  end

  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      entrar @profile
      flash[:success] = "Conta criada com sucesso! :)"
        redirect_to @profile
    else
      @title = "Cadastrar"
      render 'novo'
    end
  end

  def destroy
    Profile.find(params[:id]).destroy
    flash[:success] = "Profile destroyed."
    redirect_to profiles_path
  end

  def edit
    @title = "Editar Profile"
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      flash[:success] = "Profile Atualizado."
      redirect_to @profile
    else
      @title = "Editar Profile"
      render 'edit'
    end
  end




  private


    def correct_profile
      @profile = Profile.find(params[:id])
      redirect_to(root_path) unless current_profile?(@profile)
    end


    def admin_profile
      redirect_to(root_path) unless current_profile.admin?
    end

end