class Feedback
  include Mongoid::Document
  include Mongoid::Timestamps
  
  class << self
    def questions
      ['what is your question?',
       'what is your question? 2',
      'e']
    end
  end
end
