require_relative '../lib/continent_finder'
require 'minitest/autorun'

class ContinentFinderTest < Minitest::Test
  describe '#count' do
    it 'returns the correct number of continents' do
      finder = ContinentFinder.new('test/input/2-continents-map.txt')
      assert_equal 2, finder.count
    end
  end
end
