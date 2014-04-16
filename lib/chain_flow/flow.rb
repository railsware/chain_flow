module ChainFlow
  class Flow
    attr_reader :chain, :flow, :flow_binding, :context

    def initialize(data, &block)
      @data = data
      @flow = block
      @chain = []
      @flow_binding = flow.binding
      @context = flow_binding.eval("self")
    end

    def exec
      build_chain
      chain.each do |method_name, args|
        @data = context.send(method_name, *args.unshift(@data))
      end
      @data
    end

    def build_chain
      chain = []
      instance_eval &flow
    end

    def method_missing(name, *args)
      chain << [name, args]
    end
  end
end
