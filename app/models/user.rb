class User < ApplicationRecord
  
  before_save   :downcase_email

  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :password_expirable, :password_archivable, :expirable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :password_expirable, :secure_validatable, 
         :password_archivable, :expirable, 
         :omniauthable, :omniauth_providers => [:google, :facebook, :amazon, :twitter]

  
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }, 'valid_email2/email': { mx: true, disposable: true }
  validates_presence_of :tcs, inclusion: { in: [ true ] }, message: "must be accepted to use this site!"
  #validates :image, :allow_blank

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = (('0'..'30').to_a + ('a'..'z').to_a + ('A'..'Z').to_a + ["!", "@", "$", "%", "^","&"]).shuffle.first(25).join
      user.provider = auth.provider
      user.uid = auth.uid
      user.all = auth.to_json
      user.name = auth.info.name
      user.tcs = true
      if auth.provider == 'amazon'
        user.location = auth.extra.postal_code
      else
        user.image = auth.info.image
        user.location = auth.info.location
      end
    end
  end

  def set_default_role
    self.role ||= :user
  end


  private
  
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end
  
end
