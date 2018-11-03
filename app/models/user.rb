class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :password_expirable, :password_archivable, :expirable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :password_expirable, #:secure_validatable, 
         :password_archivable, :expirable, 
         :omniauthable, :omniauth_providers => [:google, :facebook, :amazon, :twitter]

  
  
  validates :email, presence: true, 'valid_email2/email': { mx: true, disposable: true }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end
  
end
