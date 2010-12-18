require 'spec_helper'

describe Answer do
  let(:answer) do
  Factory(:question, :body => 'What is green?').answers.build(:body => 'Frogs')
  end
  it "lives in a question" do
    answer.save
    assert {
      !answer.question.nil? && 
      answer.question.body == 'What is green?'
    }
    
  end
end
