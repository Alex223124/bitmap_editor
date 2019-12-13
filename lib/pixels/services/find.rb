module Pixels
  module Services
    class Find

      def initialize(object, pixels, opts = {})
        @object = object
        @pixels = pixels
        @opts = opts
      end

      def run
        case @object
        when "pixels_by_column"
          @pixels.select{ |p| p.column_num == @opts[:column].to_i }
        when "pixel"
          @pixels.select{ |p| p.column_num == @opts[:column].to_i && p.row_num == @opts[:row].to_i }.first
        end
      end

    end
  end
end