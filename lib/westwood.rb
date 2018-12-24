require 'chronic_duration'

module Westwood

  def self.sermon_calculator
    @sermon_calculator ||= Westwood::SermonCalculator.new
  end
end

require_relative 'westwood/sermon_calculator'
