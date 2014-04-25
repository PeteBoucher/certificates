require File.expand_path '../../app.rb', __FILE__
require 'rack/test'

set :environment, :test

def app; Sinatra::Application; end

describe "Certificate Verification Application" do
  include Rack::Test::Methods
  it "should allow accessing the home page" do
    get '/'
    last_response.should be_ok
  end

  describe 'verify' do
    it 'should find a certificate record by hash' do
      hash = '1234randomstring5678'
      Certificate.should_receive(:find_by_identifier).with(hash)
      get 'verify/' + hash
    end
  end
end