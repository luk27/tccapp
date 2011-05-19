class EquipesController < ApplicationController







def new
@equipe = Equipe.new
end





def create
@profile = Profile.find(current_profile)
#@profile = Profile.find(params[:membro_id])
@projeto = Projeto.find(params[:projeto_id])
params[:equipe] = {:membro_id => @profile.id, :projeto_id => @projeto.id}
#params[:equipe] = {:membro_id => @profile.id}
@equipe = @projeto.equipes.create(params[:equipe])
if @equipe.save
redirect_to @profile
else
redirect_to @profile
end
end



#def create_membership
 # @projeto = Projeto.find params[:id]
 # if @projeto.equipes.create( :member_id => params[:member_id])
#	redirect_to @projeto
 # else
#	 render :action => 'show'
 # end

#end




end
