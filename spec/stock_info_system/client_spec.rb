# frozen_string_literal: true

RSpec.describe StockInfoSystem::Client do
  subject { StockInfoSystem::Client.new(Fixture::PARSED_USER_INPUT) }

  before(:each) do
    allow(StockInfoSystem::API).to(
      receive(:get_stock_information).and_return(Fixture::DATASET)
    )
  end

  it "makes available dataset" do
    expect(subject).to respond_to(:dataset)
  end

  describe "#get_stock_data" do
    it "returns stock info" do
      result = subject.get_stock_data

      expect(result[0]["Date"]).to eq Fixture::ZIPPED_DATASET["Date"]
      expect(result[0]["Close"]).to eq Fixture::ZIPPED_DATASET["Close"]
    end
  end
end
