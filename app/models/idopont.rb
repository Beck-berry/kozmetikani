class Idopont < ApplicationRecord
  validates :clientsName, :date, :todo, :minutes, presence: true
  belongs_to :user
  validates :user, presence: true
  has_and_belongs_to_many :kezeles

  def start_time
    self.date
  end
end
