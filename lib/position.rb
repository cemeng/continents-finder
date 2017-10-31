# Position is data structure representing a coordinate in the map
class Position
  attr_accessor :x, :y, :continent

  def initialize(x:, y:)
    @x = x
    @y = y
    @continent = nil
  end

  def belongs_to_continent?
    !@continent.nil?
  end
end
