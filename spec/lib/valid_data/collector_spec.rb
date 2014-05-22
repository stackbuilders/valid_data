require 'spec_helper'

module ValidData
  describe Collector do
    let(:user_model) { double(name: 'User', count: 1) }
    let(:users)      { [double(invalid?: true), double(invalid?: true), double(invalid?: false)] }
    let(:collector)  { Collector.new([user_model]) }
    let(:result)     { Result.new("User", 2, 3) }

    before do
      user_model.stub(:find_each).and_yield(users[0]).and_yield(users[1]).and_yield(users[2])
    end

    describe "#compute_result" do
      it "returns a result object with the required information from the model" do
        expect(collector.compute_result(user_model)).to eq result
      end
    end

    describe "#each" do
      it "iterates over computed result for each model" do
        collector.each.to_a.should == [result]
      end
    end
  end
end
