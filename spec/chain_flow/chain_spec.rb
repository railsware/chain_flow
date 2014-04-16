require 'spec_helper'

describe ChainFlow::Chain do
  subject do
    described_class.new { Array.new }.
      process1(42).
      process2.
      fetch
  end

  it { should == [42, 2] }
end
