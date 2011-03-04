class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body
  referenced_in :author, :class_name => 'Steward'
  referenced_in :log
  validates_presence_of :body , :message => 'Comments gotta be real'
  validates_presence_of :log,   :message => 'Comment must be about a log'
  validates_presence_of :author,   :message => 'Comment must be posted by a author'
end
