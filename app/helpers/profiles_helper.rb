module ProfilesHelper

  def gravatar_for(profile, options = { :size => 50 })
    gravatar_image_tag(profile.email.downcase, :alt => profile.nome,
                                            :class => 'gravatar',
                                            :gravatar => options)
  end

end
