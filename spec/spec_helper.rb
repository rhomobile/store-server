require 'rubygems'

# Set environment to test
ENV['RACK_ENV'] = 'test'
ROOT_PATH = File.expand_path(File.join(File.dirname(__FILE__),'..'))
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

# Try to load vendor-ed rhoconnect, otherwise load the gem
begin
  require 'vendor/rhoconnect/lib/rhoconnect'
rescue LoadError
  require 'rhoconnect'
end

$:.unshift File.join(File.dirname(__FILE__), "..")
include Rhoconnect
require 'rhoconnect/application/init'
require 'rhoconnect/test_methods'

shared_examples "SpecHelper" do
  include Rhoconnect::TestMethods

  before(:each) do
    Store.create
    Store.flush_all
    Rhoconnect.bootstrap(ROOT_PATH)

    # setup server's test settings
    Rhoconnect::Server.set :environment, :test
    Rhoconnect::Server.set :run, false
    Rhoconnect::Server.set :use_async_model, false
    Rhoconnect::Server.set :secret, "secure!"
  end
end