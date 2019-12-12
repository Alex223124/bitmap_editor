module Commands
  class Validator

    KNOWN_METHOD_NAMES = ["I", "C", "L", "V", "H", "S" ].freeze
    AMOUNT_OF_ARGS_MAPPING = {
        "I": 2,
        "C": 0,
        "L": 3,
        "V": 4,
        "H": 4,
        "S": 0
    }.freeze
    ARGS_QUALITY_VALIDATORS_MAPPING = {
        "I": ["min_and_max_coord_satisfied?"],
        "C": ["matrix_exists?"],
        "L": ["matrix_exists?", "pixel_exists?",
                                "color_format_correct?"],
        "V": ["matrix_exists?", "first_coord_less_then_last?",
                                "verical_line_exists?",
                                "color_format_correct?"],
        "H": ["matrix_exists?", "first_coord_less_then_last?",
                                "horisontal_line_exists?",
                                "color_format_correct?"],
        "S": ["matrix_exists?"]
    }.freeze
    MIN_PIXEL_COORDINATE = 1.freeze
    MAX_PIXEL_COORDINATE = 250.freeze

    def initialize(command)
      @command = command
    end

    def run
      validate
    end

    private

    def validate
      method_name_correct? &&
      amount_of_args_correct? &&
      arguments_quality
    end

    def method_name_correct?
      if KNOWN_METHOD_NAMES.include?(@command.method_name)
        #do nothing
      else
        raise IncorrectMethodNameError.new
      end
    end

    def amount_of_args_correct?
      if AMOUNT_OF_ARGS_MAPPING[@command.method_name.to_sym] == @command.args_count
        #do nothing
      else
        raise IncorrectAmountOfArgsError.new
      end
    end

    def arguments_quality
      ARGS_QUALITY_VALIDATORS_MAPPING[@command.method_name.to_sym].each do |method_name|
        send(method_name)
      end
    end

    def min_and_max_coord_satisfied?
      @command.coordinates.each do |coordinate|
        if (MIN_PIXEL_COORDINATE..MAX_PIXEL_COORDINATE).include?(coordinate.to_i)
          #do nothing
        else
          raise IncorrectPixelCoordinatesError.new
        end
      end
    end

    # only for this two
    # V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
    # H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
    def first_coord_less_then_last?
      # < или <= ?
      @command.args[0].to_i < @command.args[1].to_i
    end

    def matrix_exists?
      @context[:matrix]
    end
    
    #
    # def verical_line_exists?
    #
    # end
    #
    # def horisontal_line_exists?
    #
    # end
    #
    # def color_format_correct?
    #
    # end
    #
    #
    # def row_exists?
    #
    # end
    #
    # def column_exists?
    #
    # end
  end
end