require_relative 'position'

# PositionsExtractor responsibles for taking an array of map rows and return the land positions only (ignoring the
# sea positions)
class LandPositionsExtractor
  def initialize(rows)
    @rows = rows
  end

  def extract
    result = []
    @rows.each_with_index do |row, row_index|
      row.chars.each_with_index do |content, column_index|
        result << Position.new(x: row_index, y: column_index) if content == '+'
      end
    end
    result
  end
end
