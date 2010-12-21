require 'carrierwave/orm/mongoid'
class Log
    include Mongoid::Document
 	  include Mongoid::Timestamps
	  field :title
	  field :story
	  field :seeds
    mount_uploader :image, ImageUploader
 	  embedded_in :steward, :inverse_of => :logs
 end
