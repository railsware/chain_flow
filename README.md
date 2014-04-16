# ChainFlow

Helps to refactor data processing with functions composition.

## Installation

Add this line to your application's Gemfile:

    gem chain_flow

Or install it yourself as:

    $ gem install chain_flow

## Usage

### Interface

Including `ChainFlow` adds two methods: `flow` and `chain`.
`flow` accepts initial data as an argument and all the processing functions go in a block.

`chain` receives initial data in a block and returns and object that can be further chained with processing functions. Call `fetch` to obtain the final result.

Processing functions should accept at least one parameter - the data. When calling these functions inside `flow` or chaining them with `chain` this first parameter should be ommitted.

### Example

    require 'chain_flow'

    class Worker
      include ChainFlow

      def flow_process
        flow(Array.new) do
          add_answer
          multiple_by(3)
        end
      end

      def chain_process
        chain { Array.new }.add_answer.multiple_by(3).fetch
      end

      private

      # first processing function
      def add_answer(data)
        data << 42
      end

      # second processing function
      def multiple_by(data, count)
        data * count
      end
    end

    Worker.new.flow_process  #=> [42, 42, 42]
    Worker.new.chain_process #=> [42, 42, 42]

## How does it work?
Notice that both `flow` and `chain` capture the caller context with closure. Calls to processing fuctions with ommitted first data parameter are intercepted with `method_missing` and called in captured caller context instead with initial data pipelined through them one-by-one.
