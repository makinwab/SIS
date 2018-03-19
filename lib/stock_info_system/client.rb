# frozen_string_literal: true

module StockInfoSystem
  # Process Input and Display Output
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

      [
        value_difference(final_value, initial_value),
        percent_return(final_value, initial_value).round(1),
        initial_value,
        final_value,
        return_period
      ]
    end

    def stock_drawdowns
      dataset['data'].map do |value|
        drawdown = (((value[2] - value[3]) / value[2]) * 100).round(1)
        [drawdown, value[0], value[2], value[3]]
      end.sort!
    end

    def stock_max_drawdown
      drawdowns = stock_drawdowns

      [
        drawdowns[-1][0],
        drawdowns[-1][2],
        drawdowns[-1][3],
        drawdowns[-1][1]
      ]
    end

    private

    def value_difference(final_value, initial_value)
      final_value - initial_value
    end

    def percent_return(final_value, initial_value)
      difference = value_difference(final_value, initial_value)

      (difference / initial_value) * 100
    end

    def return_period
      [dataset['data'][0][0], dataset['data'][-1][0]]
    end
  end
end
