# frozen_string_literal: true

RSpec.describe StockInfoSystem::Helper do
  describe ".user_input" do
    context "when a valid input is entered" do
      it "returns parsed user input" do
        allow(subject).to receive(:gets).and_return(Fixture::USER_INPUT)

        expect(subject.user_input).to eq Fixture::PARSED_USER_INPUT
      end
    end

    context "when an invalid input is entered" do
      it "is pending" do
      end
    end
  end
end
  