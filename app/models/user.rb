class User < ApplicationRecord
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]  
  validates :username, presence: true, uniqueness: true, length: {minimum: 3, maximum: 25}, uniqueness: { case_sensitive: false }
end
