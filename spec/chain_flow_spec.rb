require 'spec_helper'

describe ChainFlow do
  def process1(data, point); data + [point]; end
  def process2(data); data + [2]; end
  let(:dummy_class) { Class.new { extend ChainFlow } }

  describe '.flow' do
    context 'normal order' do
      subject do
        dummy_class.flow([]) do
          process1(42)
          process2
        end
      end

      it { should == [42, 2] }
    end

    context 'revered order' do
      subject do
        dummy_class.flow([]) do
          process2
          process1(42)
        end
      end

      it { should == [2, 42] }
    end
  end

  describe '.chain' do
    subject do
      dummy_class.chain { [] }.
        process1(42).
        process2.
        fetch
    end

    it { should == [42, 2] }
  end
end
