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

        "L": ["min_and_max_coord_satisfied?", "matrix_exists?",
                                "pixel_exists?", "color_format_correct?"],

        "V": ["min_and_max_coord_satisfied?", "matrix_exists?", "column_exists?",
                                "first_coord_less_then_last?",
                                "vertical_line_exists?",
                                "color_format_correct?"],

        "H": ["min_and_max_coord_satisfied?", "matrix_exists?", "first_coord_less_then_last?",
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
      method_name_correct? && amount_of_args_correct? && arguments_quality_correct?
    end

    def method_name_correct?
      if KNOWN_METHOD_NAMES.include?(@command.method_name)
        true
      else
        raise IncorrectMethodNameError.new
      end
    end

    def amount_of_args_correct?
      if AMOUNT_OF_ARGS_MAPPING[@command.method_name.to_sym] == @command.args_count
        true
      else
        raise IncorrectAmountOfArgsError.new
      end
    end

    def arguments_quality_correct?
      ARGS_QUALITY_VALIDATORS_MAPPING[@command.method_name.to_sym].each do |method_name|
        if send(method_name)
          true
        end
      end
    end

    def min_and_max_coord_satisfied?
      @command.coordinates.each do |coordinate|
        if (MIN_PIXEL_COORDINATE..MAX_PIXEL_COORDINATE).include?(coordinate.to_i)
          true
        else
          raise IncorrectPixelCoordinatesError.new
        end
      end
    end

    def first_coord_less_then_last?
      @command.coordinates[1].to_i < @command.coordinates[2].to_i
    end

    def matrix_exists?
      if @context[:matrix]
        true
      else
        raise MatrixDoesntExistsError.new
      end
    end

    def pixel_exists?
      if @context[:matrix].pixel_exists?(*@command.coordinates)
        true
      else
        raise PixelDoesntExistsError.new
      end
    end

    def column_exists?
      if @context[:matrix].column_exists?(@command.column)
        true
      else
        raise ColumnDoesntExistsError.new
      end
    end

    def color_format_correct?
      if (@command.color == @command.color.upcase) && @command.color.size == 1
        true
      else
        raise IncorrectColorFormatError.new
      end
    end

    def vertical_line_exists?
      @context[:matrix].vertical_line_exists?(*@command.coordinates)
    end

  end
end