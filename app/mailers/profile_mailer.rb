# encoding: UTF-8
class ProfileMailer < ActionMailer::Base
 # default :from => "tcc.app.usp@gmail.com"
 default :from => "tcc.app.usp@gmail.com"

  
  def alerta_membros(email, nome)
    @email = email
    @nome = nome
    mail(:to => @email, :subject => "Olá #{@nome}. Encontre parceiros de projeto no TCC-APP!")
  end
  
  def alerta_postagens(email, nome)
    @email = email
    @nome = nome
    mail(:to => @email, :subject => "Olá #{@nome}. Melhore a comunicação dentro do seu projeto no TCC-APP!")
  end
  
end
