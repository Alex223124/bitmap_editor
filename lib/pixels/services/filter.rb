module Pixels
  module Services
    class Filter

      FILTERS_MAPPING = {
          "by_column": "column_num",
          "by_row": "row_num"
      }

      def initialize(type, pixels, starts_at, ends_at)
        @type = type
        @pixels = pixels
        @starts_at = starts_at
        @ends_at = ends_at
      end

      def run
        @pixels.select{ |p| coordinates.include?(p.public_send(attribute))}
      end

      private

      def coordinates
        (@starts_at.to_i..@ends_at.to_i).to_a
      end

      def attribute
        FILTERS_MAPPING[@type.to_sym]
      end

    end
  end
end