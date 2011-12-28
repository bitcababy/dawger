# require 'simplecov'
# SimpleCov.start

require 'rubygems'

ENV["RAILS_ENV"] = "test"

$LOAD_PATH << "." unless $LOAD_PATH.include?(".")
require 'logger'

begin
  require "rubygems"
  require "bundler"

  if Gem::Version.new(Bundler::VERSION) <= Gem::Version.new("0.9.5")
    raise RuntimeError, "Your bundler version is too old." +
     "Run `gem install bundler` to upgrade."
  end

  # Set up load paths for all bundled gems
  Bundler.setup
rescue Bundler::GemNotFound
  raise RuntimeError, "Bundler couldn't find some gems." +
    "Did you run \`bundle install\`?"
end

Bundler.require
# require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require File.expand_path('../../lib/dawger', __FILE__)

# require 'ammeter/init'

unless [].respond_to?(:freq)
  class Array
    def freq
      k=Hash.new(0)
      each {|e| k[e]+=1}
      k
    end
  end
end

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
Dir["#{File.dirname(__FILE__)}/factories/**/*.rb"].each { |f| require f }

# RSpec.configure do |config|
#   # == Mock Framework
#   #
#   # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
#   #
#   # config.mock_with :mocha
#   # config.mock_with :flexmock
#   # config.mock_with :rr
#   config.mock_with :rspec
# 
#   # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
#   config.fixture_path = "#{::Rails.root}/spec/fixtures"
# 
#   # If you're not using ActiveRecord, or you'd prefer not to run each of your
#   # examples within a transaction, remove the following line or assign false
#   # instead of true.
#   config.use_transactional_fixtures = true
# end

