require 'chronic_duration'

module Westwood

  def self.website_address_for_speech
    "<say-as interpret-as='spell-out'>www.</say-as>westwood<say-as interpret-as='spell-out'>cma</say-as>.org.</speak>"
  end

  def self.sermon_streamer
    @sermon_streamer ||= Westwood::SermonStreamer.new
  end

  def self.sermon_calculator
    @sermon_calculator ||= Westwood::SermonCalculator.new
  end
end

require_relative 'westwood/sermon_calculator'
require_relative 'westwood/sermon_streamer'
