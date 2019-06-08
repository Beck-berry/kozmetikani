class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :idoponts, dependent: :destroy
  validates :email, presence: true
  validates :email, uniqueness: true
  has_many :kezeles, through: :idoponts
end
