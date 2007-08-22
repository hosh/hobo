ENV['RAILS_ENV'] ||= 'mysql'
require File.dirname(__FILE__) + '/rails_root/config/environment.rb'

# Run the migrations
ActiveRecord::Migrator.migrate("#{RAILS_ROOT}/db/migrate")

require 'spec/rails'

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = File.dirname(__FILE__) + "/fixtures/"
  config.before(:each, :behaviour_type => :controller) do
    raise_controller_errors
  end

  # You can declare fixtures for each behaviour like this:
  #   describe "...." do
  #     fixtures :table_a, :table_b
  #
  # Alternatively, if you prefer to declare them only once, you can
  # do so here, like so ...
  #
  #   config.global_fixtures = :table_a, :table_b
  #
  # If you declare global fixtures, be aware that they will be declared
  # for all of your examples, even those that don't use them.
end
