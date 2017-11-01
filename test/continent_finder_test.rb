require_relative '../lib/continent_finder'
require 'minitest/autorun'

class ContinentFinderTest < Minitest::Test
  describe '#count' do
    it 'returns the correct number of continents' do
      finder = ContinentFinder.new('test/input/2-continents-map.txt')
      assert_equal 2, finder.count
    end
  end

  describe '#stats' do
    it 'returns the statistic of contintents' do
      finder = ContinentFinder.new('test/input/2-continents-map.txt')
      expected_result = [ 'There are 2 Continents',
                          'Continent 1 has 220 +',
                          'Continent 2 has 266 +' ].join("\n")
      assert_equal expected_result, finder.stats
    end
  end
end
