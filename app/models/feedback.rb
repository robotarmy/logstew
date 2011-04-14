class Feedback
  include Mongoid::Document
  include Mongoid::Timestamps
  field :answers
  field :comment
  class << self
    def questions
      [%%Is the purpose of this page clear to you?%,
       %%What were you expecting to find on this page?%,
       %%What would you use this page for?%]
    end
  end
end
