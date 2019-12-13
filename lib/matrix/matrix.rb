module Matrix
  class Matrix

    FIND_TYPES = {
        "vertical": "pixels_by_column",
        "horizontal": "pixels_by_row"
    }

    def initialize(height, width)
      @width = width.to_i
      @height = height.to_i

      @rows = (1..@height).to_a
      @columns = (1..@width).to_a
      @pixels = create_pixels
    end

    def column_exists?(column)
      find_("pixels_by_column", column).count > 0
    end

    def row_exists?(row)
      find_("pixels_by_row", row).count > 0
    end

    def pixel_exists?(row, column)
      Pixels::Services::Find.new("pixel", @pixels, {row: row, column: column} ).run
    end

    def line_exists?(type, starts_at, ends_at, row_or_column)
      pixels = find_(FIND_TYPES[type.to_sym], row_or_column)
      coords = possible_line_coords(starts_at, ends_at)
      expected_pixels_amount = coords.count
      result = detect_line(type, pixels, coords)
      expected_pixels_amount == result.count
    end

    def detect_line(type, pixels, coords)
      Pixels::Services::DetectLine.new(type, pixels, coords).run
    end

    def color_pixel(row, column, color)
      Pixels::Services::Color.new("pixel", @pixels, color,
                                 { row: row, column: column }).run
    end

    def draw_vertical_line(column, starts_at, ends_at, color)
      Pixels::Services::DrawLine.new("vertical", @pixels, column,
                                     starts_at, ends_at, color).run
    end

    def draw_horizontal_line(column, starts_at, ends_at, color)
      Pixels::Services::DrawLine.new("horizontal", @pixels, column,
                                     starts_at, ends_at, color).run
    end

    def clear_pixels
      Pixels::Services::Clear.new(@pixels).run
    end

    def find_(object, attr)
      Pixels::Services::Find.new(object, @pixels, {attr: attr}).run
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