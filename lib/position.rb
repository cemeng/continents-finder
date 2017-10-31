# Position is data structure representing a coordinate in the map
class Position
  attr_accessor :x, :y

  def initialize(x:, y:)
    @x = x
    @y = y
  end
end
