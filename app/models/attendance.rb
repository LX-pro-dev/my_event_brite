class Attendance < ApplicationRecord

  after_create :new_guest_send

  belongs_to :guest, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'

  validates :stripe_customer_id, presence: true, uniqueness: true

  after_create :new_guest_send

  private
  
  def new_guest_send
      AttendanceMailer.new_guest_email(self.attended_event.host).deliver_now
  end

end
