# frozen_string_literal: true

RSpec.describe StockInfoSystem do
  subject { StockInfoSystem::Engine.new }

  it 'has a version number' do
    expect(StockInfoSystem::VERSION).not_to be nil
  end

  describe '#start' do
    it 'returns an instance of StockInfoSystem::Client' do
      allow(StockInfoSystem::Helper).to receive(:gets).and_return(Fixture::USER_INPUT)

      expect(subject.start).to be_an_instance_of StockInfoSystem::Client
    end
  end
end
