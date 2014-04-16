require "chain_flow/flow"
require "chain_flow/chain"
require "chain_flow/version"

module ChainFlow
  def flow(data, &block)
    Flow.new(data, &block).exec
  end

  def chain(&block)
    Chain.new(&block)
  end
end
