class Bitmap

  attr_reader :matrix

  def initialize(width, height)
    @matrix = Matrix::Matrix.new(width, height)
  end

end