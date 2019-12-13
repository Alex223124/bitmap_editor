module Pixels
  module Services
    class DetectVerticalLine

      def initialize(pixels, coords)
        @pixels = pixels
        @coords = coords
      end

      def run
        found = []
        @coords.each do |row_num|
          result = @pixels.select { |a| a.row_num == row_num }.first
          @pixels.delete(result) if result
          found << result if result
        end
        found
      end

    end
  end
end