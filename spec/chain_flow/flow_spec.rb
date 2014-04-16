require 'spec_helper'

describe ChainFlow::Flow do
  let(:block) do
    Proc.new do
      process1(42)
      process2
    end
  end
  let(:data) { [] }

  let(:processor) { described_class.new(data, &block) }

  describe '#build_chain' do
    before { processor.build_chain }
    subject { processor.chain }

    it { should have(2).items }
    its([0]) { should == [:process1, [42]]}
    its([1]) { should == [:process2, []]}
  end

  describe '#exec' do
    subject { processor.exec }

    it { should == [42, 2] }
  end
end
