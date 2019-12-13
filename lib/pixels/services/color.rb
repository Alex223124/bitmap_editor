module Pixels
  module Services
    class Color

      def initialize(object, pixels, color, opts = {})
        @object = object
        @pixels = pixels
        @color = color
        @opts = opts
      end

      def run
        case @object
        when "all"
          @pixels.each do |pixel|
            pixel.set_color(@color)
          end
        when "pixel"
          pixel = Pixels::Services::Find.new("pixel", @pixels,
                                            {row: @opts[:row],
                                             column: @opts[:column]}).run
          pixel.set_color(@color)
        end
      end

    end
  end
end