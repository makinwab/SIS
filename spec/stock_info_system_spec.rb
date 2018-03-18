# frozen_string_literal: true

RSpec.describe StockInfoSystem do
  subject { StockInfoSystem::Engine.new }

  it 'has a version number' do
    expect(StockInfoSystem::VERSION).not_to be nil
  end

  describe '#start' do
    it 'prints output to the console' do
      allow(StockInfoSystem::Helper).to receive(:gets).and_return(Fixture::USER_INPUT)
      expect(subject).to receive(:start).and_return('output')

      subject.start
    end
  end
end
