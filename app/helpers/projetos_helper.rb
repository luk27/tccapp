module ProjetosHelper
def profile_projeto?(profile)
	profile == @projeto.profile
	end
	
	   def gravatar_projeto(profile, options = { :size => 30 })
	gravatar_image_tag(profile.email.downcase, :alt => profile.nome,
											:class => 'gravatar',
											:gravatar => options)
  end
	
	
	
end
