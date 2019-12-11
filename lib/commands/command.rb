module Commands
  class Command

    def initialize(method_name, arguments)
      @method_name = method_name
      @arguments = arguments
    end
  end
end