require 'action_dispatch'
require 'capybara/rails'
require 'capybara/dsl'
require 'akephalos'
Capybara.javascript_driver = :akephalos

module RSpec::Rails
  module IntegrationExampleGroup
    extend ActiveSupport::Concern

    include ActionDispatch::Integration::Runner
    include RSpec::Rails::TestUnitAssertionAdapter
    include ActionDispatch::Assertions
    include Capybara
    # include this and get infinite loop on 1.9.2 with undef'd methods
    #include RSpec::Matchers

    module InstanceMethods
      def app
        ::Rails.application
      end

      def last_response
        page
      end
    end

    included do
      before do
        @router = ::Rails.application.routes
      end
    end

    RSpec.configure do |c|
      c.include self, :example_group => { :file_path => /\bspec\/integration\// }
    end
  end
end


