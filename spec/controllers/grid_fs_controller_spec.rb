require 'spec_helper'

describe GridFsController do
  let(:steward) do
    Factory(:steward)
  end
  
  let(:image) do
    filename = File.join(Rails.root,'public','images','rails.png')
    CarrierWave::Test::Matchers::ImageLoader.load_image(filename)
  end
  
  it "serves a file from grid fs" do
    pending "how do i set up this rack oriented test? " do
      log = steward.logs.build(:title => 'rails',
                               :image => image)
      controller.env = {'PATH_INFO' => "log/#{log.id}/rails.png" }
      controller.serve 
      assert {
        controller.response_body == image &&
        controller.status != :file_not_found
      }
    end
  end
end
