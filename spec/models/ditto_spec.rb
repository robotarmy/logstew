require 'spec_helper'

describe Ditto do
  context "a question" do
    let(:steward) do
      Factory(:steward)
    end

    let(:question) do
      Factory(:question, :body => "Is cloud computing different?")
    end

    it "can be ditto'd by a steward" do
      c = Ditto.count
      Ditto.create!(:by => steward.id, :for => question.id ,:what => question.class.to_s)
      assert {
        Ditto.count > c
      }
    end
  end
end
