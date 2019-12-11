module Pixels
  class Pixel

    DEFAULT_COLOR = "O".freeze

    def initialize(column_number, raw_number, color = DEFAULT_COLOR)
      @column_number = column_number
      @raw_number = raw_number
      @color = color
    end

  end
end