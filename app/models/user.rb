class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :password_expirable, :password_archivable, :expirable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :password_expirable, #:secure_validatable, 
         :password_archivable, :expirable
  
  validates :email, presence: true, 'valid_email2/email': { mx: true, disposable: true }
end
