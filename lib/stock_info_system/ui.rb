# frozen_string_literal: true

# Handles print outs
module StockInfoSystem
  module UI
    def self.display_start_message
      print "Get Return on Stock and Drawdowns \n"
      print "Provide input in this format" \
        " [API_KEY=XXXX {Stock Symbol} {Date OR Start Date - End Date}] \n"

      print ">>"
    end

    def self.display_output_label(label)
      print "\n#{label}:\n"
    end

    def self.display_stock_info_output(date, close, low, high)
      print "#{date}: Closed at #{close} (#{low} ~ #{high}) \n"
    end

    def display_return_output
    end

    def display_drawdown_output
    end

    def display_max_drawdown_output
    end
  end
end
