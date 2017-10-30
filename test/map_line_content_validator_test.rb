require_relative '../lib/map_line_content_validator'
require 'minitest/autorun'

class MapLineContentValidatorTest < Minitest::Test
  describe '.valid?' do
    it 'returns false when line contains character other than + or spaces' do
      line = 'xx'
      assert_equal MapLineContentValidator.valid?(line), false
    end

    it 'returns true when line only contain + and / or spaces' do
      line = '+ '
      assert_equal MapLineContentValidator.valid?(line), true
    end
  end
end
