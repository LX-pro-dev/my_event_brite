class AttendanceMailer < ApplicationMailer

  default from: 'no-reply@lx-pro-my-event-brite.herokuapp.com'

  def guest_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance = attendance
    #@user = User.find(!@attendance.user_id)

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://lx-pro-my-event-brite.herokuapp.com/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Participation confirmée !')
  end
  
  def new_guest_email(user)
    @user = user
    @url = 'http://lx-pro-my-event-brite.herokuapp.com/login'
    mail(to: @user.email, subject: 'You have a new guest !')
  end
end
