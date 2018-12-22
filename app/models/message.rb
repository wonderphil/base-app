class Message
  include ActiveModel::Model
  attr_accessor :name, :email, :phone, :body
  validates :name, :email, :body, presence: true
end
