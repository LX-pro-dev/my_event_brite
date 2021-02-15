class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  after_create :welcome_send

  has_many :attendances
  has_many :events, through: :attendances

  validates :email, presence: true, uniquness: true, email: true
  validates :encrypted_password, presence: true, length: { minimum: 8 }
  validates :description, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def welcome_send
      UserMailer.welcome_email(self).deliver_now
  end
end
