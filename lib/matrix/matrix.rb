module Matrix
  class Matrix

    def initialize(width, height)
      @width = width.to_i
      @height = height.to_i

      @rows = (1..@height).to_a
      @columns = (1..@width).to_a
      @pixels = create_pixels
    end

    def color_pixel(row, column, color)
      pixel = find_pixel(row, column)
      pixel.set_color(color)
    end

    def clear_pixels
      service = Pixels::Services::Clear.new(@pixels)
      @pixels = service.run
    end

    def find_pixel(row, column)
      @pixels.select{ |p| p.column_num == column.to_i && p.row_num == row.to_i }.first
    end

    def pixel_exists?(row, column)
      find_pixel(row, column)
    end

    private

    def create_pixels
      Pixels::Services::Create.new(@rows, @columns).run
    end

  end
end