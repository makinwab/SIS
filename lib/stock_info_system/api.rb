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

      return {
        'column_names' => [
          'Date',
          'Open',
          'High',
          'Low',
          'Close',
          'Volume',
          'Ex-Dividend',
          'Split Ratio'
        ],
        'start_date' => '2018-01-01',
        'end_date' => '2018-01-02',
        'data' => [
          [
            '2018-01-02',
            170.16,
            172.3,
            169.26,
            172.26,
            25_048_048.0,
            0.0,
            1.0
          ]
        ]
      }
  
      # JSON.parse(response)['dataset_data']
    end

    def self.api_url=(api_url)
      api_url
    end
  end
end
