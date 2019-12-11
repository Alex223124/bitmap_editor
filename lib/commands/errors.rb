class IncorrectMethodNameError < StandardError
  def message
    "M and N coordinates should be integers between 1 and 250"
  end
end

class IncorrectPixelCoordinatesError < StandardError
  def message
    "M and N coordinates should be integers between 1 and 250"
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