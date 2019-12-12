module Matrix
  class Matrix

    def initialize(width, height)
      @width = width.to_i
      @height = height.to_i

      @rows = (1..@height).to_a
      @columns = (1..@width).to_a
      @pixels = create_pixels
    end

    def clear_pixels
      service = Pixels::Services::Clear.new(@pixels)
      @pixels = service.run
    end

    private

    def create_pixels
      Pixels::Services::Create.new(@rows, @columns).run
    end

  end
end