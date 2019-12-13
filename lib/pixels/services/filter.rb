module Pixels
  module Services
    class Filter

      def initialize(object, pixels, starts_at, ends_at)
        @object = object
        @pixels = pixels
        @starts_at = starts_at
        @ends_at = ends_at
      end

      def run
        case @object
        when "by_column"
          @pixels.select{ |p| (@starts_at.to_i..@ends_at.to_i).to_a.include?(p.row_num)}
        end
      end

    end
  end
end