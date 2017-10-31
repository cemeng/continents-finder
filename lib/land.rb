# Land is data structure representing a coordinate of a land in the map
class Land
  attr_accessor :x, :y, :continent

  def initialize(x:, y:)
    @x = x
    @y = y
    @continent = nil
  end

  def belongs_to_a_continent?
    !@continent.nil?
  end
end
