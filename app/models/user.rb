class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hosted_events, class_name: 'Event', foreign_key: 'host_id'
  has_many :attendances, foreign_key: 'guest_id'
  has_many :attended_events, through: :attendances, source: :attended_event


  validates :email, presence: true, uniqueness: true, format: {with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'should look like something@provider.extension.'}
  validates :encrypted_password, presence: true, length: { minimum: 8 }
  #validates :first_name, :last_name, format: {with: /[a-zA-Z]/, message: 'should only contain UTF-8 letters'}
  
  before_save :downcase_it_all

  after_create :welcome_send

  private

  # all to downcase - less problems in the DB
  def downcase_it_all
    self.email.downcase! if self.email
    self.first_name.downcase! if self.first_name
    self.last_name.downcase! if self.last_name
  end

  def welcome_send
      UserMailer.welcome_email(self).deliver_now
  end
end
