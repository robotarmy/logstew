class Address 
 include Mongoid::Document
 include Mongoid::Timestamps
 embedded_in :steward, :inverse_of => :address
 field :name
 field :zipcode
 field :street
end
