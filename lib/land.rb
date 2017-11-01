# frozen_string_literal: true

# Land is data structure representing a coordinate of a land in the map
# the continent variable is used to mark the continent where the land belongs to
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
