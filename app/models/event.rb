class Event < ApplicationRecord
  has_many :attendances, foreign_key: 'attended_event_id'
  belongs_to :host, class_name: 'User'
  has_many :guests, through: :attendances, source: :guest

  validates :start_date, presence: true
  validates :duration, presence: true, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :title, presence: true, length: {minimum: 5, maximum:140}
  validates :description, presence: true, length: {minimum: 20, maximum:1000}
  validates :price, presence: true, numericality: { :only_integer =>true }, :inclusion => { :in => 1..1000 }
  validates :location, presence: true
  
  validate :start_date_cannot_be_in_the_past
  
  validate :duration_must_be_multiple_of_5

  # instance methods for display
  def display_start_date
    start_date.strftime("%a, %b %-d")
  end

  def display_end_date
    (start_date + duration * 60).strftime("%A - %B %-d - %Hh%M")
  end
  
  private
  # custom validator for start date
  def start_date_cannot_be_in_the_past
    errors.add(:start_date, 'cannot be in the past') if
    start_date < Time.zone.today
  end

  # custom validator for duration
  def duration_must_be_multiple_of_5
    errors.add(:duration, 'must be a multiple of 5') if
    duration%5 != 0
  end
end
