require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe "ApplicationController" do
  include_examples "SpecHelper"
	include Rack::Test::Methods
	include Rhoconnect

  def app
    @app = Rack::URLMap.new Rhoconnect.url_map
  end

  it "should process ApplicationController /login" do
    post "/rc/#{Rhoconnect::API_VERSION}/app/login", {"login" => 'testuser', "password" => ''}.to_json,
          {'CONTENT_TYPE'=>'application/json; charset=UTF-8'}
    last_response.status.should == 200
  end

  it "should process ApplicationController /rps_login" do
    pending
  end
end