require_relative '../lib/map_reader'
require 'minitest/autorun'

class MapReaderTest < Minitest::Test
  describe '#read' do
    let(:reader) { MapReader.new }

    it 'raises an exception when file is not found' do
      assert_raises(Exception) { reader.read('test/input/non-existent-map.txt') }
    end

    describe 'when file does not contain 50 files' do
      it 'raises an exception' do
        assert_raises(Exception) { reader.read('test/input/map-with-10-lines-only.txt') }
      end

      it 'exception\' message specify the error' do
        exception = assert_raises(Exception) { reader.read('test/input/map-with-10-lines-only.txt') }
        assert_includes exception.message, 'Map file must has exactly 50 lines'
      end
    end

    describe 'when file has at least one invalid line' do
      it 'raises an exception' do
        assert_raises(Exception) { reader.read('test/input/map-with-invalid-content.txt') }
      end

      it 'exception\'s message contain the line number of invalid line' do
        exception = assert_raises(Exception) { reader.read('test/input/map-with-invalid-content.txt') }
        assert_includes exception.message, 'Invalid content on line 0'
      end
    end

    it 'does not raise an error when file content is valid' do
      assert_kind_of Array, reader.read('test/input/valid-map.txt')
    end
  end
end
