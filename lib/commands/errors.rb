class IncorrectMethodNameError < StandardError
  def message
    "Error! Incorrect Command! Accepted commands are:\n"\
    "I M N - Create a new M x N image with all pixels coloured white (O).\n"\
    "C - Clears the table, setting all pixels to white (O).\n"\
    "L X Y C - Colours the pixel (X,Y) with colour C.\n"\
    "V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).\n"\
    "H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).\n"\
    "S - Show the contents of the current image"
  end
end

class IncorrectPixelCoordinatesError < StandardError
  def message
    "Error! M and N coordinates should be integers between 1 and 250"
  end
end

class IncorrectAmountOfArgsError < StandardError
  def message
    "Error! Incorrect Amount of Arguments! Accepted commands are:\n"\
    "I M N - Create a new M x N image with all pixels coloured white (O).\n"\
    "C - Clears the table, setting all pixels to white (O).\n"\
    "L X Y C - Colours the pixel (X,Y) with colour C.\n"\
    "V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).\n"\
    "H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).\n"\
    "S - Show the contents of the current image"
  end
end

class MatrixDoesntExistsError < StandardError
  def message
    "Error! You should first create an image (matrix), and only then you can modify it"
  end
end

class PixelDoesntExistsError < StandardError
  def message
    "Error! Column and row you specified do not exist in the current matrix."
  end
end

class IncorrectColorFormatError < StandardError
  def message
    "Error! Colours should be specified by capital letters."
  end
end

class ColumnDoesntExistsError < StandardError
  def message
    "Error! Column you specified do not exist in the current matrix."
  end
end

class RowDoesntExistsError < StandardError
  def message
    "Error! Row you specified do not exist in the current matrix."
  end
end

class FirstCoordShouldBeLessThenLastError < StandardError
  def message
    "Error! First coordinate should be less then second!"
  end
end

class VerticalLineDoesntExistsError < StandardError
  def message
    "Error! Vertical line do not exist in the current matrix."
  end
end

class HorizontalLineDoesntExistsError < StandardError
  def message
    "Error! Horizontal line do not exist in the current matrix."
  end
end