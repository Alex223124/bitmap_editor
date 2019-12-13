module Matrix
  class Matrix

    def initialize(width, height)
      @width = width.to_i
      @height = height.to_i

      @rows = (1..@width).to_a
      @columns = (1..@height).to_a
      @pixels = create_pixels
    end

    def column_exists?(column)
      find_pixels_by_column(column).count > 0
    end

    def pixel_exists?(row, column)
      Pixels::Services::Find.new("pixel", @pixels, {row: row, column: column} ).run
    end

    def vertical_line_exists?(column, starts_at, ends_at)
      pixels_by_column = find_pixels_by_column(column)
      coords = possible_line_coords(starts_at, ends_at)
      expected_vert_pixels_amount = coords.count
      result = Pixels::Services::DetectVerticalLine.new(pixels_by_column, coords).run
      expected_vert_pixels_amount == result.count
    end

    def color_pixel(row, column, color)
      Pixels::Services::Color.new("pixel", @pixels, color,
                                 { row: row, column: column }).run
    end

    def draw_vertical_line(column, starts_at, ends_at, color)
      Pixels::Services::DrawVerticalLine.new(@pixels, column, starts_at,
                                             ends_at, color).run
    end

    def clear_pixels
      Pixels::Services::Clear.new(@pixels).run
    end

    def find_pixels_by_column(column)
      Pixels::Services::Find.new("pixels_by_column",
                                 @pixels, {column: column}).run
    end

    def possible_line_coords(starts_at, ends_at)
      (starts_at.to_i..ends_at.to_i)
    end

    private

    def create_pixels
      Pixels::Services::Create.new(@rows, @columns).run
    end

  end
end