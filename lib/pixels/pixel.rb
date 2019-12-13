module Pixels
  class Pixel

    attr_reader :column_num, :row_num, :color

    DEFAULT_COLOR = "O".freeze

    def initialize(column_num, row_num, color = DEFAULT_COLOR)
      @column_num = column_num
      @row_num = row_num
      @color = color
    end

    def set_color(color = DEFAULT_COLOR)
      @color = color
    end

  end
end