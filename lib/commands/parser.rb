module Commands
  class Parser

    def initialize(commands)
      @commands = commands
    end

    def run
      parsed_commands = []
      @commands.each do |command|
        parsed_commands << Commands::Command.new(method_name(command), arguments(command))
      end
    end

    private

    def method_name(command)
      command.split(" ").first
    end

    def arguments(command)
      command.split(" ").drop(1)
    end
  end
end