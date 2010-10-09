require 'spec_helper'

describe WelcomeController do
 get :index
 assert {
   response.status == :success
}
end
