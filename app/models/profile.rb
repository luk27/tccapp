# encoding: UTF-8
class Profile < ActiveRecord::Base
attr_accessor :password
attr_accessible :nome, :email, :sexo, :sobrenome, :data_nascimento, :password, :password_confirmation


has_many :cursos, :dependent => :destroy
has_many :habilidades, :dependent => :destroy
accepts_nested_attributes_for :cursos, :allow_destroy => true


has_private_messages

  has_many :dono_projetos, :class_name => "Projeto", :foreign_key => :profile_id, :dependent => :destroy
  has_many :participacao_equipes, :through => :dono_projetos, :source => :equipes, :dependent => :destroy

  has_many :projetos, :through => "equipes", :dependent => :destroy
  has_many :equipes, :foreign_key => "membro_id", :dependent => :destroy

  has_many :projetos_aprovados, :through => :equipes, :source => :projeto, :conditions => [ "equipes.status = ? ", true], :dependent => :destroy
  has_many :projetos_aplicados, :through => :equipes, :source => :projeto, :conditions => [ "equipes.status = ? ", false], :dependent => :destroy


has_many :postagems, :dependent => :destroy

#AVALIACOES
has_many :avaliacaos, :dependent => :destroy, :foreign_key => "avaliado_id"
has_many :avaliadores, :through => :avaliacaos, :source => :profile, :foreign_key => "profile_id", :dependent => :destroy

#####################

  searchable do
    text :nome, :email
    text :nome_habilidade do
      habilidades.map(&:nome)
    end
    text :descricao_habilidade do
      habilidades.map(&:descricao)
    end
    text :nome_cursos do
      cursos.map(&:nome)
    end
    text :universidade do
      cursos.map(&:universidade)
    end
    text :ano_ingresso do
      cursos.map(&:ano_ingresso)
    end
    text :ano_termino do
      cursos.map(&:ano_termino)
    end
  end

##ANTIGO##
#has_many :projetos, :foreign_key => "profile_id" #talvez nao precise disso
#has_many :equipes, :foreign_key => "membro_id"
##ANTIGO##

  #has_many :projetos_divididos, :class_name => "Projeto", :through => :equipes, :foreign_key => "membro_id"

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

  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }

  before_save :encrypt_password

#NOVO CODIGO
def feed
Curso.where("profile_id = ?", id)
#cursos
end


  def self.total_notas
    query = "SELECT p.nome, p.email, p.sobrenome, SUM(a.nivel_habilidade) as total, a.avaliado_id " <<
            "FROM profiles p, avaliacaos a " <<
            "WHERE p.id = a.avaliado_id " <<
            "GROUP BY p.nome, a.avaliado_id, p.email, p.sobrenome;"

    profile = Profile.find_by_sql(query)
  end

#NOVO CODIGO

  def has_password?(submitted_password)
    senhacrip == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    profile = find_by_email(email)
    return nil  if profile.nil?
    return profile if profile.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    profile = find_by_id(id)
    (profile && profile.salt == cookie_salt) ? profile : nil
  end

  private

    def encrypt_password
      self.salt = make_salt if new_record?
      self.senhacrip = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end




end
