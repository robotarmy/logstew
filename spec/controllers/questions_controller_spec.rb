require 'spec_helper'

describe QuestionsController do
  let(:steward) do
    Factory(:steward)
  end

  let(:elder) do
    Factory(:elder, :email => 'elder@flower.com')
  end

  let(:log) do
    steward.logs.create(:story => 'I have planted sunflowers!',
                        :title => 'Sunflower',
                        :seeds => 'sunflower')
  end

  let(:question_body) do
   'What is a suitable companion for sunflower?'
  end

  let(:question) do
    Factory(:question, :body => question_body)
  end
  context 'requires login' do
    it "redirects if no login" do
      [:create,:answer].each do |action|
        post action , :question_id => 'blah'
        assert {
          response.status == 302
        }
      end
    end
  end
  context 'a steward asks a question about another stewards log' do

    it "can be asked" do
      question_count = Question.count
      sign_in steward
      post :create, {
        :question => {:body => question_body}, 
        :log_id => log.id
      }
      assert {
        response.status == 200 &&
        Question.count > question_count
      }
    end

    it "cannot be answered by a steward" do
      sign_in Factory(:steward)
      post :answer, {
        :answer => {:body => "Roses are pretty awesome - so are Tulips"},
        :question_id => question.id
      }
      assert {
        response.status == 403 # forbidden
      }
    end

    it "can be answered by an elder" do
      answer_count = question.answers.count
      sign_in elder
      post :answer, {
        :answer => {
          :body => "Sunflowers will draw ants and ladybugs, which will protect tomatoes from aphids"
        }, 
        :question_id => question.id
      }
      assert {
        response.status == 200 &&
        question.reload.answers.count > answer_count 
      }
    end
  end
end
