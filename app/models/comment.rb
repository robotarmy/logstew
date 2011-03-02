class Comment
  include Mongoid::Document
  field :body
  belongs_to :creator, :class_name => 'Steward'
  belongs_to :log
  validates_presence_of :body , :message => 'Comments gotta be real'
  validates_presence_of :log,   :message => 'Comment must be about a log'
  validates_presence_of :creator,   :message => 'Comment must be posted by a creator'
end
