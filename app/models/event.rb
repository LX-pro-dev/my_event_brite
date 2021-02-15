class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true, length: {minimum: 5, maximum:140}
  validates :description, presence: true, length: {minimum: 20, maximum:1000}
  validates :price, presence: true, numericality: {minimum: 1, maximum: 1000}
  validates :location, presence: true

  def not_in_past
      if self.start_date < Date.today
          errors.add(:start_date, 'not in past')
      end
  end
end
