class MessageMailer < ApplicationMailer

  def contact(message)
    @body = message.body

    mail to: ENV['ACTION_MAILER_DEFAULT_TO'], from: message.email
  
  
  end
end
