require 'carrierwave/orm/mongoid'
class Log
    include Mongoid::Document
 	  include Mongoid::Timestamps
	  field :title
	  field :story
	  field :seeds
    mount_uploader :image, FileUploader
 	  embedded_in :steward, :inverse_of => :logs
    has_many :comments
    def creator_name
      steward.name
    end
 end
