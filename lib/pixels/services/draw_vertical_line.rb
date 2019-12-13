module Pixels
  module Services
    class DrawVerticalLine

      def initialize(pixels, column, starts_at, ends_at, color)
        @pixels = pixels
        @column = column
        @starts_at = starts_at
        @ends_at = ends_at
        @color = color
      end

      def run
        pixels = Pixels::Services::Find.new("pixels_by_column", @pixels,
                                            {column: @column}).run
        pixels = Pixels::Services::Filter.new("by_column", pixels,
                                              @starts_at, @ends_at).run
        Pixels::Services::Color.new("all", pixels, @color).run
      end

    end
  end
end