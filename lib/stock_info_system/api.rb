# frozen_string_literal: true

require 'json'
require 'net/http'

module StockInfoSystem
  # Make API calls
  module API
    API_URL = 'https://www.quandl.com/api/v3/datasets/WIKI'.freeze

    def self.get_stock_information(stock_symbol, start_date, end_date, api_key)
      uri = URI(
        "#{API_URL}/#{stock_symbol}" \
        "/data.json?start_date=#{start_date}&end_date=#{end_date}&#{api_key}"
      )
      response = Net::HTTP.get(uri)

      JSON.parse(response)['dataset_data']
    end
  end
end
