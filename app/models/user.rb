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
      :presence => "We need your email address",
      :is_unique => "We already have that email address",
      :format => "Whoa there cowboy!! That aint no email"
    }
  property :password_digest, String, length: 60

  def password=(password)
    @password = password  #WHYYY? DOES THIS NOT REVEAL THE PASSWORD?
    self.password_digest = BCrypt::Password.create(password)
  end
end
