class Ditto
  include Mongoid::Document
  field :by 
  field :for
  field :what 
  validates_presence_of :what,:for,:by
end
