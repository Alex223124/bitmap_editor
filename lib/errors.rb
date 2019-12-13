class IncorrectInputError < StandardError
  def message
    "Error! Please provide correct file."
  end
end