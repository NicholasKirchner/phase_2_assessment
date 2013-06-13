class User < ActiveRecord::Base
  #TODO : Use bcrypt to store hashed passwords and authenticate users
  #I say "Fuck you, bcrypt.  I do it myself"
  before_save :encrypt_password

  attr_accessor :password

  validates :email, presence: true
  validates_uniqueness_of :email
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    user.password_hash == Digest::SHA1.hexdigest("#{password} #{user.salt}") ? user : nil
  end

  private

    def encrypt_password
      self.salt = Digest::SHA1.hexdigest("#{Time.now} #{self.email}")
      self.password_hash = Digest::SHA1.hexdigest("#{self.password} #{self.salt}")
      self.password = nil
    end
end
