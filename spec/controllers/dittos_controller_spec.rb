require 'spec_helper'

describe DittosController do
  let(:steward) do
    Factory(:steward)
  end
  let(:question_body) do
    'What is a suitable companion for sunflower?'
  end

  let(:question) do
    Factory(:question, :body => question_body)
  end

  context 'requires login' do
    it "redirects if no login" do
      [:create].each do |action|
        post action
        assert {
          response.status == 302
        }
      end
    end
  end

  it "another steward can indicate they have the same question" do
    sign_in Factory(:steward)
    ditto_count = Ditto.count
    post :create, {:for => question.reload.id, :what => question.class.to_s}
    assert {
      response.status == 200 &&
      Ditto.count > ditto_count
    }
  end

end
