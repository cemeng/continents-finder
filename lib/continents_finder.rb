# frozen_string_literal: true

require_relative 'map_reader'

# ContinentsFinder responsible for finding a continent given a map file
class ContinentsFinder
  def initialize(filepath)
    @lands = MapReader.new.read(filepath)
    @continent_count = 0
    find_continents
  end

  def count
    @continent_count
  end

  def stats
    message = [header]
    (1..count).each do |continent_number|
      message << "Continent #{continent_number} has #{land_count_for(continent_number)} +"
    end
    message.join("\n")
  end

  private

  def header
    count == 1 ? 'There is 1 Continent' : "There are #{count} Continents"
  end

  def find_continents
    @lands.each do |land|
      unless land.belongs_to_a_continent?
        @continent_count += 1
        add_to_continent(land, @continent_count)
      end
    end
  end

  def land_count_for(continent)
    @lands.count { |l| l.continent == continent }
  end

  def positions_around_of(land)
    [
      { x: land.x - 1, y: land.y - 1 },
      { x: land.x,     y: land.y - 1 },
      { x: land.x + 1, y: land.y - 1 },
      { x: land.x,     y: land.y - 1 },
      { x: land.x,     y: land.y + 1 },
      { x: land.x - 1, y: land.y + 1 },
      { x: land.x,     y: land.y + 1 },
      { x: land.x + 1, y: land.y + 1 }
    ]
  end

  # add_to_cotinent adds a land to continent by setting the continent marker on the land
  # then it will try to recursively mark the adjacent lands
  def add_to_continent(land, continent)
    land.continent = continent
    positions_around_of(land).each do |position|
      @lands.each do |l|
        if !l.belongs_to_a_continent? && position[:x] == l.x && position[:y] == l.y
          add_to_continent(l, continent)
        end
      end
    end
  end
end
