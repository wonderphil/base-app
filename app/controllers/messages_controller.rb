class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @soical_heading = true
    @message = Message.new
    @address = company_address
  end

  def create
    @soical_heading = true
    @address = company_address
    @message = Message.new message_params
    if @message.valid? && verify_recaptcha(model: @message)
      MessageMailer.contact(@message).deliver_now
      redirect_to contact_path
      flash[:success] = "We have received your message and will be in touch soon!"
    else
      flash[:alert] = "There was an error sending your message. Please try again."
      render :new
    end
  end

  private
    def message_params
      params.require(:message).permit(:name, :email, :phone, :message, :speciality)
    end

    def company_address
      if !ENV['COMPANY_ADDRESS_1'].blank?
        address = ENV['COMPANY_ADDRESS_1'] + "<br>"
        if !ENV['COMPANY_ADDRESS_2'].blank?
          address = address + ENV['COMPANY_ADDRESS_2'] + "<br>"
        end
        if !ENV['COMPANY_ADDRESS_CITY'].blank?
          address = address + ENV['COMPANY_ADDRESS_CITY'] + "<br>"
        end
        if !ENV['COMPANY_ADDRESS_COUNTRY'].blank?
          address = address + ENV['COMPANY_ADDRESS_COUNTRY'] + "<br>"
        end
        if !ENV['COMPANY_ADDRESS_POSTCODE'].blank?
          address = address + ENV['COMPANY_ADDRESS_POSTCODE']
        end
        return address
      end
    end

end
