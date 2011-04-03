require 'spec_helper'

describe FeedbackController do
  describe "actions" do
    it "#create" do
      questions = ['what do you like most?','what is your favorite colour?'],
      answers   = ['I like life!', 'I like green'],
      comment   = %%Blue is also nice, Red is the colour of blood, tomatoes,
        and sunsets over the ocean when the light is just right%,
      page_url  = %%http://url%

      lambda do
      post :create , :feedback => {
        :questions => questions,
        :answers   => answers,
        :comment   => comment,
        :page_url  => page_url
      }
      end.should change(Feedback,:count).by(1)

      feedback = Feedback.last
      feedback.answers.should  == answers
      feedback.questions.should == questions
      feedback.comment.should  == comment
      feedback.page_url.should == page_url
      feedback.created_at.should_not be_nil
    end
  end
end
