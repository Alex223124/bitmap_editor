module Pixels
  module Services
    class Create

      def initialize(rows, columns)
        @rows = rows
        @columns = columns
      end

      def run
        pixels = []
        positions.each do |position|
          pixels << Pixels::Pixel.new(position[0], position[1])
        end
        pixels
      end

      private

      def positions
        @rows.product(@columns)
      end

    end
  end
end