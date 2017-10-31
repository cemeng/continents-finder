require_relative 'map_line_content_validator'
require_relative 'land_positions_extractor'

# MapReader is a class that responsible for reading a map file
class MapReader
  def read(filepath)
    rows = File.readlines(filepath).map { |row| extract_map_content(row) }
    validate rows
    LandPositionsExtractor.new(rows).extract
  end

  private

  def extract_map_content(row)
    row[2..82]
  end

  def validate(rows)
    validate_map_dimension rows
    validate_content rows
  end

  def validate_content(rows)
    rows.each_with_index do |row, index|
      raise MapReader::FileContentError, "Invalid content on row #{index}" unless MapLineContentValidator.valid?(row)
    end
  end

  def validate_map_dimension(rows)
    raise MapReader::FileContentError, 'Map file must has exactly 50 rows.' if rows.size != 50
  end

  class FileContentError < StandardError
  end
end
