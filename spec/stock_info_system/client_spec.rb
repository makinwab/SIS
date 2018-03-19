# frozen_string_literal: true

RSpec.describe StockInfoSystem::Client do
  subject { StockInfoSystem::Client.new(Fixture::PARSED_USER_INPUT) }

  before(:each) do
    allow(StockInfoSystem::API).to(
      receive(:get_stock_information).and_return(Fixture::DATASET)
    )
  end

  it 'makes available dataset' do
    expect(subject).to respond_to(:dataset)
  end

  describe '#stock_data' do
    it 'returns general stock info' do
      result = subject.stock_data

      expect(result[0]['Date']).to eq Fixture::ZIPPED_DATASET['Date']
      expect(result[0]['Close']).to eq Fixture::ZIPPED_DATASET['Close']
    end
  end

  describe '#stock_return_data' do
    it 'returns stock return information in a period' do
      result = subject.stock_return_data

      expect(result).not_to be_empty
      expect(result).to match_array Fixture::RETURN_INFO
    end
  end

  describe '#stock_drawdowns' do
    it 'returns the stock drawdowns' do
      result = subject.stock_drawdowns

      expect(result).to match_array Fixture::DRAWDOWN
    end
  end

  describe '#stock_max_drawdown' do
    it 'returns the max drawdown' do
      result = subject.stock_max_drawdown

      expect(result).to match_array Fixture::DRAWDOWN.reverse[-1]
    end
  end
end
