module Commands
  class Command

    attr_reader :method_name, :args

    def initialize(method_name, args)
      @method_name = method_name
      @args = args
    end

    def args_count
      @args.count
    end

    def coordinates
      case @method_name
      when "I"
        [@args[0], @args[1]]
      when "L"
        [@args[0], @args[1]]
      when "V"
        [@args[0], @args[1], @args[2]]
      when "H"
        [@args[0], @args[1], @args[2]]
      end
    end

    def color
      case @method_name
      when "L"
        @args[2]
      end
    end

  end
end