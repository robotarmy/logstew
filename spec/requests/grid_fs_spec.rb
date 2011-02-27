require 'spec_helper'

describe GridFs do
  let(:steward) do
    Factory(:steward)
  end
  
  let(:uploader) do
    filename = File.join(Rails.root,'public','images','rails.png')
    CarrierWave::Test::Matchers::ImageLoader.load_image(filename)
  end
  
  it "serves a file from grid fs" do
      log = steward.logs.create(:title => 'rails',
                                :image => uploader.image)
      get log.image.url

      assert {
        response.content_type == 'image/png' &&
        response.status != :file_not_found
      }
  end
end

