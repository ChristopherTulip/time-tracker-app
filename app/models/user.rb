class User < ActiveRecord::Base
  has_many :entries

  validates :email, presence: true
end
