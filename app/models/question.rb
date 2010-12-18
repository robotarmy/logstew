class Question
  include Mongoid::Document
  field :body
  embeds_many :answers
  referenced_in :log
  validates_presence_of :body
end
