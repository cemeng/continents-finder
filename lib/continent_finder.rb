require_relative 'map_reader'

# ContinentFinder responsible for finding a continent given a map file
class ContinentFinder
  def initialize(filepath)
    @lands = MapReader.new.read(filepath)
    @continent_count = 0
    find_continents
  end

  def count
    @continent_count
  end

  private

  def find_continents
    @lands.each do |land|
      unless land.belongs_to_a_continent?
        @continent_count = @continent_count + 1
        add_to_continent(land, @continent_count)
      end
    end
  end

  # add_to_cotinent adds a land to continent by setting the continent marker on the land
  # then it will try to recursively mark the adjacent lands
  def add_to_continent(land, continent)
    land.continent = continent
    [
      { x: land.x - 1, y: land.y - 1 }, # top left
      { x: land.x, y: land.y - 1 }, # top center
      { x: land.x + 1, y: land.y - 1 }, # top right
      { x: land.x, y: land.y - 1 }, # left
      { x: land.x, y: land.y + 1 }, # right
      { x: land.x - 1, y: land.y + 1 }, # top left
      { x: land.x, y: land.y + 1 }, # top center
      { x: land.x + 1, y: land.y + 1 }
    ].each do |pos|
      @lands.each do |p|
        if !p.belongs_to_a_continent? && pos[:x] == p.x && pos[:y] == p.y
          add_to_continent(p, continent)
        end
      end
    end
  end
end
