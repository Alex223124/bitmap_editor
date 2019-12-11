class ParseInput

  LAST_THREE_CHAR = [-3,3]

  def initialize(input)
    @input = input
  end

  def run
    if is_textfile?
      parse_textfile
    end
  end

  private

  def is_textfile?
    @input[LAST_THREE_CHAR[0], LAST_THREE_CHAR[1]] == "txt"
  end

  def parse_textfile
    binding.pry
    commands = []
    File.open(@input).each do |line|
      binding.pry
      commands << line.chomp
    end
    commands
  end
end