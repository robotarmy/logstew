require 'spec_helper'

describe ApplicationHelper do
  let(:uploader) do
    filename = File.join(Rails.root,'public','images','rails.png')
    CarrierWave::Test::Matchers::ImageLoader.load_image(filename)
  end

  let(:me) do
    Factory(:steward)
  end

  let(:my_log_title) do
    me.logs.create(:story => 'oohya', 
                   :title => 'oohyatitle')
  end

  let(:my_log_no_title) do
    me.logs.create(:story => 'hiy')
  end

  let(:you) do
    Factory(:steward)
  end

  let(:you_log_image) do
    you.logs.create(:story => 'soup',
                    :image_filename => 'name_of_file.png')
  end

  let(:you_log_no_image) do
    you.logs.create(:story => 'soup')
  end


  describe "should not include posts without an image or title" do
    before do
      my_log_no_title
      you_log_no_image
    end
    it '#get_recent_logs' do
      helper.get_recent_logs.should be_empty
    end
    it "#render_last_post" do
      helper.render_last_posts.should_not match(/#{steward_logs_path(me)}/)
      helper.render_last_posts.should_not match(/#{steward_logs_path(you)}/)
    end
  end

  describe "should include posts with an image or title" do
    before do
      my_log_title
      you_log_image
    end
    it '#get_recent_logs' do
      helper.get_recent_logs.should == [ my_log_title,
                                         you_log_image ]
    end

    it "#render_last_post" do
      helper.render_last_posts.should match(/#{steward_logs_path(me)}/)
      helper.render_last_posts.should match(/#{steward_logs_path(you)}/)
    end
  end
end
