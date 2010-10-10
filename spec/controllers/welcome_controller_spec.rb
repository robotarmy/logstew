require 'spec_helper'

describe WelcomeController do
it "index" do
 get :index
 r = response
 assert {
   r.status == :success
}
end
end
