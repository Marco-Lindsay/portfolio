class WelcomeController < ApplicationController


  def index
  end

  def contact
  end

  def send_message
    if params[:name].empty? || params[:email].empty? || params[:message].empty?
      redirect_to '/contact'
      flash[:notice]= "Please note that all fields are required"
    else
      name = params[:name]
      email = params[:email]
      message = params[:message]
      UserMailer.contact(name, email, message).deliver
      redirect_to root_path
      flash[:notice]= "Your message has been sent!"
    end
  end
end
