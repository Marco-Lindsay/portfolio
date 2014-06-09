class UserMailer < ActionMailer::Base


  def contact(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(subject: 'Email from portfolio site', to: 'marco@marcolindsay.com', from: 'marco@marcolindsay.com')
  end
end
