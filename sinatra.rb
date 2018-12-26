require 'bundler/setup'
require 'sinatra'
require 'ralyxa'
require "bugsnag"

require_relative 'lib/westwood'

Bugsnag.configure do |config|
  config.api_key = "eb7f40797e4e348e5c4c77615d82b026"
  project_root = File.expand_path(File.dirname(__FILE__))
end

set :raise_errors, true

use Bugsnag::Rack

before do
  if request.body.size > 0
    request.body.rewind
    @params = Sinatra::IndifferentHash.new
    @params.merge!(JSON.parse(request.body.read))
  end
end

post '/' do
  Ralyxa::Skill.handle(request)
end
