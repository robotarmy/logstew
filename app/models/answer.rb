class Answer
  include Mongoid::Document
  field :body
  embedded_in :question, :inverse_of => :answers
  validates_presence_of :body
end
