class Idopont < ApplicationRecord
  validates :fromTime, :todo, presence: true
  belongs_to :user
  validates :user, presence: true
  has_and_belongs_to_many :kezeles

  def start_time
    self.fromTime
  end
  def end_time
    self.toTime
  end
end