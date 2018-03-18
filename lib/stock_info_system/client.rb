# frozen_string_literal: true

# Process Input and Display Output
module StockInfoSystem
  class Client
    attr_reader :dataset

    def initialize(input_data)
      @dataset = API.get_stock_information(
        input_data[:stock_symbol],
        input_data[:start_date],
        input_data[:end_date],
        input_data[:api_key]
      )

      @helper = StockInfoSystem::Helper
    end

    def stock_data
      stock_info = []

      @dataset['data'].sort!.length.times do |index|
        stock_info << @helper.get_hash_from_column_data(
          @dataset['column_names'].zip(@dataset['data'][index])
        )
      end

      stock_info
    end

    def stock_return_data
      initial_value = dataset['data'][0][4]
      final_value = dataset['data'][-1][4]
      value_difference = final_value - initial_value
      percent_return = (value_difference / initial_value) * 100

      [
        value_difference,
        percent_return.round(1),
        initial_value,
        final_value,
        dataset['data'][0][0],
        dataset['data'][-1][0]
      ]
    end
  end
end
