require 'spec_helper'

describe FeedbackController do
  before do
    sign_in Factory(:steward)
  end
  describe "actions" do
    it "#create" do
      request.env['HTTP_REFERER'] = root_path
      answers = {'what do you like most?' => 'I like life!',
                  'what is your favorite colour?' => 'I like green'}

      comment   = %%Blue is also nice, Red is the colour of blood, tomatoes,
        and sunsets over the ocean when the light is just right%,
      page_url  = %%http://url%

      lambda do
      post :create , :feedback => { 
        :answers   => answers,
        :comment   => comment,
        :page_url  => page_url
      }
      end.should change(Feedback,:count).by(1)

      feedback = Feedback.last
      feedback.answers.should  == answers
      feedback.comment.should  == comment
      feedback.page_url.should == page_url
      feedback.created_at.should_not be_nil
    end

    it "#index" do
      Factory(:feedback)
      get :index
      assigns[:feedback].should_not be_nil
      assigns[:feedback].should_not be_empty
    end
  end
end
