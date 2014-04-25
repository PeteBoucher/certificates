require 'rack/test'

require File.expand_path '../../app.rb', __FILE__

set :environment, :test

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure { |c| c.include RSpecMixin }