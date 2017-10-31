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
        assert_includes exception.message, 'Map file must has exactly 50 rows'
      end
    end

    describe 'when file has at least one invalid line' do
      it 'raises an exception' do
        assert_raises(Exception) { reader.read('test/input/map-with-invalid-content.txt') }
      end

      it 'exception\'s message contain the row number of invalid row' do
        exception = assert_raises(Exception) { reader.read('test/input/map-with-invalid-content.txt') }
        assert_includes exception.message, 'Invalid content on row 0'
      end
    end

    describe 'when file is valid' do
      it 'does not raise an error' do
        assert_silent { reader.read('test/input/valid-map.txt') }
      end

      it 'returns an array of lands' do
        result = reader.read('test/input/valid-map.txt')
        assert_kind_of Land, result.first
      end
    end
  end
end
