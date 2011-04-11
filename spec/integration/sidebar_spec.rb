require 'spec_helper'
describe 'Sidebar -' do
  let(:me) do
    s = Factory(:steward)
    s.create_address(:public_name => :sam.to_s, 
                     :public_location_name => 'Home',
                     :zipcode => '94102')
    s
  end
  let(:another) do
    s = Factory(:steward)

    s.create_address(:public_name => :amber.to_s, 
                     :public_location_name => 'Home',
                     :zipcode => '94118')
    s
  end

  let(:my_log) do
    Factory(:log, :story => 'storytime', :title => 'cake is nice', :steward => me)
  end

  let(:another_log) do
    Factory(:log, :story => 'timestore', :title => 'lets grow beans')
  end

  context "After Log in" do
    before(:each) do
      my_log
      another_log
      sign_in me
    end
    context "sidebar page" do
      it "has recent posts" do
        visit(steward_logs_path(my_log.steward))
        within('.starboard') do
          page.should have_content(my_log.title)
          page.should have_content(my_log.steward.name)
          page.should have_content(another_log.title)
          page.should have_content(another_log.steward.name)
        end
      end
      
      
      it "has an edit link for my logs" do
        within("#log_#{my_log.id}") do 
          page.should have_css('a.edit', :text => 'edit')        
        end
      end

      it "doesn't have an edit link for other steward's logs" do
        within("#log_#{another_log.id}") do 
          page.should_not have_css('a.edit', :text => 'edit')        
        end
      end


      it "has title link" do
        visit(steward_logs_path(my_log.steward))
        page.should have_css('.starboard .log .title a', :text => my_log.title)
        click_link(my_log.title)
        current_path.should == steward_log_path(my_log.steward,my_log)
      end

      it "has username link" do
        visit(steward_logs_path(my_log.steward))
        page.should have_css('.starboard .log .name a', :text => my_log.steward.name)
        click_link(my_log.steward.name)
        current_path.should == steward_logs_path(my_log.steward)
      end
    end
  end
end

