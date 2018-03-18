# frozen_string_literal: true

RSpec.describe StockInfoSystem::Client do
  subject { StockInfoSystem::Client.new(Fixture::PARSED_USER_INPUT) }

  it "makes available dataset" do
    expect(subject).to respond_to(:dataset)
  end
end
