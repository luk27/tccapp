class PostagemsController < ApplicationController

#def new
#@postagem = Postagem.new
#end

def edit

end

def update

end





 def create
    @profile = Profile.find(current_profile)
	@postagem = Postagem.create params[:postagem].merge(:projeto => Projeto.find(params[:projeto_id]), :profile => Profile.find(current_profile))
	#@postagem = Postagem.create(:projeto => Projeto.find(params[:projeto_id]), :profile => Profile.find(current_profile))
	if @postagem.save
	  flash[:success] = "Mensagem criada com sucesso."
	  redirect_to(:back)
	else
	  redirect_to(:back)
	end
  end

  def destroy
  @postagem = Postagem.find(params[:id])
  	@postagem.destroy
	redirect_to(:back)
  end



end
