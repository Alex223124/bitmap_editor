module Pixels
  module Services
    class DetectLine

      LINES_MAPPING = {
          "vertical": "row_num",
          "horizontal": "column_num"
      }

      def initialize(type, pixels, coords)
        @type = type
        @pixels = pixels
        @coords = coords
      end

      def run
        found = []
        @coords.each do |coord|
          result = @pixels.select { |a| a.public_send(LINES_MAPPING[@type.to_sym]) == coord }.first
          @pixels.delete(result) if result
          found << result if result
        end
        found
      end

    end
  end
end