require 'spec_helper'

module ValidData
  describe ParallelRunner do
    let(:padding) { 0 }

    let(:model_klass) do
      Class.new do
        def self.name
          "Klass"
        end

        def self.abstract_class?
          false
        end

        def self.count
          0
        end
      end
    end

    describe "callbacks" do
      let(:error) { Class.new(StandardError) }
      let(:adapter) { double("adapter", descendants: [model_klass]) }

      it "accepts a block to be ran after fork" do
        expect(Process).to receive(:fork).and_yield

        runner = ParallelRunner.new(padding, adapter) { |r| raise error if runner == r }

        expect {
          runner.run(1)
        }.to raise_error(error)
      end
    end

    describe "#run" do
      context "when there are more models/descendants than processes" do
        let(:adapter) { double("adapter", descendants: [model_klass] * 7) }

        it "distributes the models/descendants between the processes" do
          expect(Process).to receive(:fork).exactly(2).and_yield.and_return(nil)
          expect(Collector).to receive(:new).with([model_klass] * 4).and_return([])
          expect(Collector).to receive(:new).with([model_klass] * 3).and_return([])

          ParallelRunner.new(padding, adapter).run(2)
        end
      end

      context "when there are less (or equal) models/descendants than processes" do
        let(:adapter) { double("adapter", descendants: [model_klass] * 2) }

        it "forks one process for each model/descendant" do
          expect(Process).to receive(:fork).exactly(:twice).and_yield.and_return(nil)
          expect(Collector).to receive(:new).exactly(2).with([model_klass]).and_return([])

          ParallelRunner.new(padding, adapter).run(3)
        end
      end
    end
  end
end
