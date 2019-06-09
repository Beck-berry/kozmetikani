class Kezele < ApplicationRecord
  has_and_belongs_to_many :idoponts
  has_many :users, through: :idoponts
  validates :name, :minutes, presence: true
  validates :name, uniqueness: true
end
