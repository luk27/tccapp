class Profile < ActiveRecord::Base
attr_accessor :senha
attr_accessible :nome, :email, :sexo, :sobrenome, :data_nascimento, :senha, :senha_confirmation

email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


validates :nome, :presence => true,
:length   => { :maximum => 12 }


validates :sobrenome, :presence => true,
:length   => { :maximum => 25 }


validates :email, :presence => true,
:length   => { :maximum => 35 },
:format   => { :with => email_regex },
:uniqueness => { :case_sensitive => false }

#validates :data_nascimento, :presence => true

#validates :sexo, :presence => true

  validates :senha, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }


  before_save :encriptar_senha

  # Return true if the user's password matches the submitted password.
  def tem_senha?(senha_submetida)
    senhacrip== encriptar(senha_submetida)
  end


  private

    def encriptar_senha
      self.salt = make_salt if new_record?
      self.senhacrip = encriptar(senha)
    end

    def encriptar(string)
      secure_hash("#{salt}--#{string}")
    end

   def make_salt
      secure_hash("#{Time.now.utc}--#{senha}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end


end
