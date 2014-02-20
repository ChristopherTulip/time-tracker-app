class User < ActiveRecord::Base
  has_many :entries

  has_secure_password

  validates :email, presence: true
  validates :password, presence: true, on: :create

private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
