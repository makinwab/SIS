# frozen_string_literal: true

require 'json'
require 'net/http'

module StockInfoSystem
  # Make API calls
  module API
    @api_url = 'https://www.quandl.com/api/v3/datasets/WIKI'

    def self.get_stock_information(stock_symbol, start_date, end_date, api_key)
      uri = URI(
        "#{@api_url}/#{stock_symbol}" \
        "/data.json?start_date=#{start_date}&end_date=#{end_date}&#{api_key}"
      )
      response = Net::HTTP.get(uri)

      JSON.parse(response)['dataset_data']
    end

    def self.api_url=(api_url)
      api_url
    end
  end
end
