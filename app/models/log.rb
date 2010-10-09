require 'carrierwave/orm/mongoid'
        class Log
          include Mongoid::Document
          mount_uploader :image, ImageUploader
        end
