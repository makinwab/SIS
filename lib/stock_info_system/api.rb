require "faraday"
require "json"

# Make API calls
module StockInfoSystem
  module API
    API_URL= URI('https://www.quandl.com/api/v3/datasets/WIKI')

    def self.get_stock_information(stock_symbol, start_date, end_date, api_key)
      uri = "#{API_URL}/#{stock_symbol}/data.json?start_date=#{start_date}&end_date=#{end_date}&#{api_key}"
      response = Faraday.get(uri)
      JSON.parse(response.body)["dataset_data"]
    end
  end
end