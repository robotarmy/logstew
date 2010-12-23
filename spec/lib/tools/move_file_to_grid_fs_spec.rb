require 'spec_helper'
require 'fileutils'

describe MoveFileToGridFs do

  context "a steward doesn't exist for the log file" do

    let(:file_path) do
      "log/image/cake/fish.png"
    end

    let(:mtg) do
      MoveFileToGridFs.new(file_path)
    end

    it "sets log to string error message " do
      assert {
        mtg.log =~ /illegal/
      }
    end
    it "raises error if cannot update" do
      assert {
        rescuing {
          mtg.update(:grid)
        }
      }
    end
    it "returns false if doesn't exist" do
      assert {
        mtg.exists_as?(:grid) == false
      }
    end
  end

  context "a steward has a log with a on disk file" do
    after(:all) do
      dir_path = File.join(Rails.root,
                           'spec',
                           'data',
                           'move_file_to_grid_fs_spec',
                           'log')
      FileUtils.rm_rf dir_path
    end

    let(:steward) do
      Factory(:steward)
    end

    let(:log) do
      steward.logs.create(:title => 'move_file_to_grid_fs_spec',
                          :image_filename => 'rails.png')
    end

    let(:file_path) do
      dir_path = File.join(Rails.root,
                           'spec',
                           'data',
                           'move_file_to_grid_fs_spec')
      log_image_path = File.join(dir_path,
                                 'log',
                                 'image',
                                 log.id.to_s)
      FileUtils.mkdir_p log_image_path
      FileUtils.copy(File.join(dir_path,log.image_filename),
                     log_image_path)
      File.join(log_image_path,log.image_filename)
    end

    let(:mtg) do
      MoveFileToGridFs.new(file_path)
    end

    it " exists as file  " do
      assert {
        mtg.exists_as?(:file) == true
      }
    end

    it " identifies the log vi the file path " do
      assert  {
        mtg.log_id == log.id.to_s
      }
    end
    
    it " identifies the correct log " do
      assert  {
        mtg.log == log
      }
    end

    it " inserts a file into the correct stewards log" do
      mtg.update(:grid) 
      assert {
        mtg.exists_as?(:grid)
      }

    end
  end
end

