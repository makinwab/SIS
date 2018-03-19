# frozen_string_literal: true

module StockInfoSystem
  # Handles print outs
  module UI
    def self.display_start_message
      print "Get Return on Stock and Drawdowns \n"
      print 'Provide input in this format' \
        " [API_KEY=XXXX {Stock Symbol} {Date OR Start Date - End Date}] \n"

      print '>>'
    end

    def self.display_output_label(label)
      print "\n#{label}:\n"
    end

    def self.display_stock_info_output(date, close, low, high)
      print "#{date}: Closed at #{close} (#{low} ~ #{high}) \n"
    end

    def self.display_return_output(
      value_difference,
      percent_return,
      initial_value,
      final_value,
      date
    )
      print "\nReturn: #{value_difference} [+#{percent_return}%]"\
        " (#{initial_value} on #{date[0]} -> #{final_value} on"\
        " #{date[1]})\n"
    end

    def display_drawdown_output; end

    def display_max_drawdown_output; end
  end
end
