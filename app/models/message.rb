class Message
  include ActiveModel::Model

  attr_accessor :name, :email, :phone, :message, :speciality

  validates :name, presence: true
  validates_presence_of :message, :length => { 
    :maximum => 250,
    :tokenizer => lambda { |str| str.scan(/\w+/) },
    :too_long  => "Please limit your message to %{count} words"
  }
  
  validates :email, presence: true, 'valid_email_2/email': { disposable: true, mx: true }
  
  
end
