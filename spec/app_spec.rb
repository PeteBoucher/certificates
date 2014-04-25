require File.expand_path '../../app.rb', __FILE__
require 'rack/test'

set :environment, :test

def app; Sinatra::Application; end

describe "My Sinatra Application" do
  include Rack::Test::Methods
  it "should allow accessing the home page" do
    get '/'
    last_response.should be_ok
  end
end