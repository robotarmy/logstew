class Steward
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
	 :recoverable, :rememberable, :trackable, :validatable
  before_validation do 
	if self.password.blank?
	self.password = 'aaaaaaa'
	self.password_confirmation = 'aaaaaaa'
end
  end
end
