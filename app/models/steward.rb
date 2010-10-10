class Steward
 include Mongoid::Document
 include Mongoid::Timestamps
  embeds_many :logs
  embeds_one  :address
  index :email, :unique => true
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable
end
