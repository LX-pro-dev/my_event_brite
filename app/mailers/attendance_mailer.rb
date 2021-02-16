class AttendanceMailer < ApplicationMailer

  default from: 'no-reply@lx-pro-my-event-brite.herokuapp.com'
  
  def new_guest_email(user)
    @user = user
    @url = 'http://lx-pro-my-event-brite.herokuapp.com/login'
    mail(to: @user.email, subject: 'You have a new guest !')
  end
end
