class Address 
 include Mongoid::Document
 include Mongoid::Timestamps
 embedded_in :steward, :inverse_of => :address
 field :public_name
 index :public_name, :unique => true
 field :zipcode
 field :public_location_name
end
