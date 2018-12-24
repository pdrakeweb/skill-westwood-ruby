require 'bundler/setup'
require 'sinatra'
require 'ralyxa'
require "bugsnag"

require_relative 'lib/westwood'

Bugsnag.configure do |config|
  config.api_key = "eb7f40797e4e348e5c4c77615d82b026"
end

set :raise_errors, true

use Bugsnag::Rack

post '/' do
  Ralyxa::Skill.handle(request)
end
