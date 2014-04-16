module ChainFlow
  class Chain
    attr_reader :chain_binding, :context

    def initialize(&block)
      @data = block.call
      @chain_binding = block.binding
      @context = chain_binding.eval("self")
    end

    def fetch
      @data
    end

    def method_missing(name, *args)
      @data = context.send(name, *args.unshift(@data))
      self
    end
  end
end
