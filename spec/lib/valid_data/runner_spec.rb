require 'spec_helper'

module ValidData
  describe Runner do
    describe "#run" do
      let(:user_model)   { double(name: 'User', count: 1, find_each: users, abstract_class?: false) }
      let(:dealer_model) { double(name: 'Dealer', count: 1, find_each: dealers, abstract_class?: false) }
      let(:users)        { [double(valid?: true)] }
      let(:dealers)      { [double(valid?: true)] }
      let(:adapter)      { double(descendants: [user_model, dealer_model]) }
      let(:runner)       { Runner.new(30, adapter) }

      it "prints the report" do
        pending
        runner.run
      end
    end
  end
end
