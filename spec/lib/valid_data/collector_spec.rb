require 'spec_helper'

module ValidData
  describe Collector do
    let(:user_model) { double(name: 'User', find_each: users, count: 1) }
    let(:users)      { [double(valid?: true)] }
    let(:collector)  { Collector.new([user_model]) }
    let(:result)     { Result.new("User", users, 1) }

    describe "#compute_result" do
      it "returns a result object with the required information from the model" do
        expect(collector.compute_result(user_model)).to eq result
      end
    end

    describe "#each" do
      let(:dealers)      { [double(valid?: true)] }
      let(:dealer_model) { double(name: 'Dealer', find_each: dealers, count: 1) }
      let(:collector)    { Collector.new([user_model, dealer_model]) }

      it "yields a computed result instance for each model in the collector" do
        results = collector.send(:models).map do |model|
          collector.compute_result(model)
        end

        collector.each.with_index { |result, i|
          results[i].should == result
        }
      end
    end
  end
end
