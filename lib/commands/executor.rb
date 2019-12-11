module Commands
  class Executor

    RECEIVERS_MAPPING = {
        "I": Bitmap,
        "C": 0,
        "L": 3,
        "V": 4,
        "H": 4,
        "S": 0
    }.freeze

    METHODS_MAPPING = {
        "I": "new",
        "C": 0,
        "L": 3,
        "V": 4,
        "H": 4,
        "S": 0
    }.freeze

    def initialize(commands)
      @commands = commands
    end

    def run
      @commands.each do |command|
        validate(command)
        execute(command)
      end
    end

    private

    def validate(command)
      validator = Commands::Validator.new(command)
      validator.run
    end

    def execute(command)
      receiver = set_receiver(command)
      method = set_method(command)
      args = command.args

      receiver.public_send(method, *args)
    end

    def set_receiver(command)
      RECEIVERS_MAPPING[command.method_name.to_sym]
    end

    def set_method(command)
      METHODS_MAPPING[command.method_name.to_sym]
    end

  end
end