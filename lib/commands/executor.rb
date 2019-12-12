module Commands
  class Executor

    RECEIVERS_MAPPING = {
        "I": Bitmap,
        "C": :matrix,
        "L": 3,
        "V": 4,
        "H": 4,
        "S": 0
    }.freeze

    METHODS_MAPPING = {
        "I": "new",
        "C": "clear_pixels",
        "L": 3,
        "V": 4,
        "H": 4,
        "S": 0
    }.freeze

    def initialize(commands)
      @commands = commands
      @context = {}
    end

    def run
      @commands.each do |command|
        validate(command)
        result = execute(command)
        update_context(command, result)
      end
    end

    private

    def validate(command)
      validator = Commands::Validator.new(command)
      validator.instance_variable_set(:@context, @context)
      validator.run
    end

    def execute(command)
      receiver = set_receiver(command)
      method = set_method(command)
      args = command.args

      receiver.public_send(method, *args)
    end

    def set_receiver(command)
      receiver = RECEIVERS_MAPPING[command.method_name.to_sym]
      if receiver.is_a?(Symbol)
        receiver = @context[receiver]
      end
      receiver
    end

    def set_method(command)
      METHODS_MAPPING[command.method_name.to_sym]
    end

    def update_context(command, result)
      case command.method_name
      when "I"
        @context[:matrix] = result.matrix
      end
    end

  end
end