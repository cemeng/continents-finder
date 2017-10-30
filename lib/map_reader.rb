require_relative 'map_line_content_validator'

# MapReader is a class that responsible for reading a map file
class MapReader
  def read(filepath)
    lines = File.readlines(filepath).map { |line| extract_land_position_content(line) }
    validate lines
    lines
  end

  private

  def extract_land_position_content(line)
    line[2..82]
  end

  def validate(lines)
    validate_map_dimension lines
    validate_content lines
  end

  def validate_content(lines)
    lines.each_with_index do |line, index|
      raise MapReader::FileContentError, "Invalid content on line #{index}" unless MapLineContentValidator.valid?(line)
    end
  end

  def validate_map_dimension(lines)
    raise MapReader::FileContentError, 'Map file must has exactly 50 lines.' if lines.size != 50
  end

  class FileContentError < StandardError
  end
end
