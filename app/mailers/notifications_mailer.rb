class NotificationsMailer < ActionMailer::Base

  default :from => "farmbowinfo@gmail.com"
  default :to => "farmbowinfo@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[FarmBow Notification] #{message.subject}")
  end

end