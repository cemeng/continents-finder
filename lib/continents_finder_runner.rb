# frozen_string_literal: true

require_relative 'continents_finder'

puts ContinentsFinder.new(ARGV[0]).stats
