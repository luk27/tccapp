class Profile < ActiveRecord::Base
attr_accessor :password
attr_accessible :nome, :email, :sexo, :sobrenome, :data_nascimento, :password, :password_confirmation

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
