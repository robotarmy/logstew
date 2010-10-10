require 'carrierwave/orm/mongoid'
        class Log
          include Mongoid::Document
 include Mongoid::Timestamps
	  field :story
          mount_uploader :image, ImageUploader
 embedded_in :steward, :inverse_of => :logs
        end
