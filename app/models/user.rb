class User < ApplicationRecord
  has_many :dances
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :email, :profile, :first_name, :last_name, :password, presence: true
end
