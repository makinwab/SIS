require 'api'
require 'helper'

# Process Input and Display Output
module StockInfoSystem
  class Client
    attr_reader :dataset

    def initialize(input_data)
      @dataset = API::get_stock_information(
        input_data[:stock_symbol],
        input_data[:start_date],
        input_data[:end_date],
        input_data[:api_key]
      )
    end
  end
end