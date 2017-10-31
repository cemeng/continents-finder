require_relative 'map_reader'

# ContinentFinder responsible for finding a continent given a map file
class ContinentFinder
  def initialize(filepath)
    @land_positions = MapReader.new.read(filepath)
    @continent_count = 0
    find_continents
  end

  def count
    @continent_count
  end

  private

  def find_continents
    @land_positions.each do |position|
      unless position.belongs_to_continent?
        @continent_count = @continent_count + 1
        mark_continent(position, @continent_count)
      end
    end
  end

  def mark_continent(position, continent)
    position.continent = continent
    [
      { x: position.x - 1, y: position.y - 1 }, # top left
      { x: position.x, y: position.y - 1 }, # top center
      { x: position.x + 1, y: position.y - 1 }, # top right
      { x: position.x, y: position.y - 1 }, # left
      { x: position.x, y: position.y + 1 }, # right
      { x: position.x - 1, y: position.y + 1 }, # top left
      { x: position.x, y: position.y + 1 }, # top center
      { x: position.x + 1, y: position.y + 1 }
    ].each do |pos|
      @land_positions.each do |p|
        if !p.belongs_to_continent? && pos[:x] == p.x && pos[:y] == p.y
          mark_continent(p, continent)
        end
      end
    end
  end
end
