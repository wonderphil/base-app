class Job
  include ActiveModel::Model

  attr_accessor :name, :email, :speciality, :message, :phone

  validates :name, :speciality, presence: true
  validates :email, presence: true, 'valid_email_2/email': { disposable: true, mx: true }
  
  
end
