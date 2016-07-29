require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address
  # validates_presence_of :email not needed because of required: true

  property :id,      Serial
  property :email,   String, required: true, unique: true,
    format: :email_address,
    :messages => {
      :presence => "Check yawh box",
      :is_unique => "SOZ, you ain't original",
      :format => "Whoa there cowboy!! That aint no email"
    }
  property :password_digest, String, length: 60

  def password=(password)
    @password = password  #WHYYY? DOES THIS NOT REVEAL THE PASSWORD?
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
