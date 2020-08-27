class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses, dependent: :destroy
  has_many :deliverer_addresses, dependent: :destroy
  has_many :addresses, through: :deliverer_addresses
  has_many :delivers
  has_many :e_boxes, through: :delivers
end
