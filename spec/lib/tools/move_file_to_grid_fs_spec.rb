require 'spec_helper'
require 'fileutils'

describe MoveFileToGridFs do
  
  context "a steward has a log with a on disk file" do
    let(:steward) do
      Factory(:steward)
    end

    let(:log) do
      steward.logs.create(:_id => 'move_file_to_grid_fs_spec_id',
                          :title => 'move_file_to_grid_fs_spec',
                          :image_filename => 'rails.png')
    end

    let(:file_path) do
      file_path = File.join(Rails.root,
                            'spec',
                            'data',
                            'move_file_to_grid_fs_spec',
                            'log',
                            'image',
                            log.id,
                            log.image_filename)
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
        mtg.log_id == log.id
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

