# frozen_string_literal: true

# MapLineContentValidator is responsible for validating a line on a map file
# The content of a line is valid if it contains nothing other than empty spaces or + characters
class MapLineContentValidator
  def self.valid?(line)
    line.gsub(/\+| /, '').empty?
  end
end
