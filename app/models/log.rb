require 'carrierwave/orm/mongoid'
class Log
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title
  field :story
  field :seeds

  mount_uploader :image, FileUploader

  belongs_to :steward

  has_many :comments
  references_many :comments, :inverse_of => :log
  def creator_name
    steward.name
  end
end
