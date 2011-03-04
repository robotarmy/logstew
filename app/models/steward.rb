class Steward
  include Mongoid::Document
  include Mongoid::Timestamps

  references_many :logs, :inverse_of => :steward
  references_many :comments, :inverse_of => :author

  embeds_one  :address

  field :cc_opt_in
  index :email, :unique => true

  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable

  def name
    (address && address.public_name) || (address && address.name) || "Anonymous"
  end

  def complete_address?
    return false if address.blank?
    return false if address.public_name.blank?
    return false if address.public_location_name.blank?
    return false if address.zipcode.blank?
    true
  end
end
