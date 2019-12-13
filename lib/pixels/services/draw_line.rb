module Pixels
  module Services
    class DrawLine

      LINES_MAPPING = {
          "vertical": "by_column",
          "horizontal": "by_row"
      }

      def initialize(type, pixels, column, starts_at, ends_at, color)
        @type = type
        @pixels = pixels
        @column = column
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
        Pixels::Services::Find.new("pixels_#{LINES_MAPPING[@type.to_sym]}",
                                   @pixels, {attr: @column}).run
      end

      def filter_by_coordinates(pixels)
        Pixels::Services::Filter.new("#{LINES_MAPPING[@type.to_sym]}", pixels,
                                              @starts_at, @ends_at).run
      end

      def color(pixels)
        Pixels::Services::Color.new("all", pixels, @color).run
      end

    end
  end
end