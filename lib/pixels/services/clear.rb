module Pixels
  module Services
    class Clear

      def initialize(pixels)
        @pixels = pixels
      end

      def run
        @pixels.each do |pixel|
          pixel.set_default_color
        end
      end

    end
  end
end