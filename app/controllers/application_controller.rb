class ApplicationController < ActionController::Base
before_filter :add_visita
  protect_from_forgery
  include SessionsHelper
  include ProjetosHelper
  include ReportingsHelper
  
  def add_visita
   # @visita = Visita.new
   # @visita.save
  end

end
