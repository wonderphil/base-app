class MessageMailer < ApplicationMailer

  def contact(message)
    @message = message
    mail to: ENV['ACTION_MAILER_DEFAULT_TO'], from: ENV['ACTION_MAILER_DEFAULT_FROM']
  end
  
end
