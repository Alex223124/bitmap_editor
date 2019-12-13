module Pixels
  module Services
    class DrawLine

      METHODS_MAPPING = {
          "vertical": {find_by: "by_column", filter_by: "by_row"},
          "horizontal": {find_by: "by_row", filter_by: "by_column"}
      }

      def initialize(type, pixels, row_or_column, starts_at, ends_at, color)
        @type = type
        @pixels = pixels
        @row_or_column = row_or_column
        @starts_at = starts_at
        @ends_at = ends_at
        @color = color
      end

      def run
        pixels = find_whole_line
        pixels = filter_by_coordinates(pixels)
        color(pixels)
      end

      private

      def find_whole_line
        Pixels::Services::Find.new("pixels_#{METHODS_MAPPING[@type.to_sym][:find_by]}",
                                   @pixels, {attr: @row_or_column}).run
      end

      def filter_by_coordinates(pixels)
        Pixels::Services::Filter.new("#{METHODS_MAPPING[@type.to_sym][:filter_by]}",
                                     pixels, @starts_at, @ends_at).run
      end

      def color(pixels)
        Pixels::Services::Color.new("all", pixels, @color).run
      end

    end
  end
end