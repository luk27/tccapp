# -*- coding: utf-8 -*-
class EquipesController < ApplicationController







def new
@equipe = Equipe.new
end

def edit

end


def update
    @equipe = Equipe.find(params[:id])
    if @equipe.update_attributes(params[:equipe])
      flash[:success] = "Membro aceito :)."
    redirect_to(:back)
    else
      redirect_to current_profile
    end
end

def destroy
  @equipe= Equipe.find(params[:id])
  @equipe.destroy
  #flash[:success] = "Membro rejeitado."
  redirect_to(:back)
end




def create
@profile = Profile.find(current_profile)
#@projeto = Projeto.find(params[:projeto_id])
#params[:equipe] = {:membro_id => @profile.id, :projeto_id => @projeto.id}
@equipe= Equipe.create(:projeto => Projeto.find(params[:projeto_id]), :membro => Profile.find(current_profile))
#@equipe = @projeto.equipes.create(params[:equipe])
if @equipe.save
flash[:success] = "Pedido enviada ao dono do Projeto. Favor aguardar a resposta do mesmo."
redirect_to @profile
else
redirect_to @profile
end
end



#def create_membership
 # @projeto = Projeto.find params[:id]
 # if @projeto.equipes.create( :member_id => params[:member_id])
# redirect_to @projeto
 # else
# render :action => 'show'
 # end

#end




end

