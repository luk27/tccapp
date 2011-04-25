# encoding: UTF-8
class PaginasController < ApplicationController
before_filter :logado, :only => [:home]


  def home
@title= "Início"
  end

  def contato
@title = `Contato`
  end

  def sobre
@title = `Sobre`
  end

  def ajuda
    @title = "Ajuda"
end



def logado
#redirect_to profile_messages_path(current_profile) unless entrar?
if entrar?
redirect_to profile_messages_path(current_profile)
end
end

end
