require 'spec_helper'

module ValidData
  describe Printer do
    let(:printer) { Printer.new(5) }

    describe "#print" do
      it "writes each row of the table with the appropriate padding" do
        result = Result.new("User", 5, 20)
        expect(printer.print(result)).to eq " User |     5 |    20" 
      end
    end

    describe "#header" do
      it "writes the header with the appropriate padding" do
        expect(printer.header).to eq "Model | Invalid | Total\n---------------"
      end
    end
  end
end
