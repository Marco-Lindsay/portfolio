class UserMailer < ActionMailer::Base


  def contact(name, email, message)
    @name = name
    @email = email
    @message = message
    mail(subject: 'Email from portfolio site', to: 'lindsay_marco@hotmail.com')
  end
end
