require 'spec_helper'

describe Log do
  let(:steward) do
    Factory(:steward)
  end
  it "references a question" do
    log = steward.logs.build(:story => 'I feed fish based tea to my plants',:title => "fish")
    question = log.questions.create(:body => 'what is in the fish fertalizer?')
    assert {
      steward.logs.find(log.id).questions.include?(question)
    }
  end
end
