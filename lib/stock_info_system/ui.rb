# frozen_string_literal: true

module StockInfoSystem
  # Handles print outs
  module UI
    def self.output_message(date, close, low, high)
      "#{date}: Closed at #{close} (#{low} ~ #{high})"
    end

    def self.drawdowns_message(drawdown, high, low, date)
      "-#{drawdown}% (#{high} on #{date} -> #{low} on #{date})"
    end

    def self.max_drawdown_message(drawdown, high, low, date)
      "Maximum drawdown: -#{drawdown}% "\
        "(#{high} on #{date} -> #{low} on #{date})"
    end

    def self.return_message(
      value_difference,
      percent_return,
      initial_value,
      final_value,
      date
    )
      "Return: #{value_difference} [+#{percent_return}%]"\
        " (#{initial_value} on #{date[0]} -> #{final_value} on"\
        " #{date[1]})"
    end

    def self.display_start_message
      print "Get Return on Stock and Drawdowns \n"
      print 'Provide input in this format' \
        " [API_KEY=XXXX {Stock Symbol} {Date OR Start Date - End Date}] \n"
      print 'To override the default API attach option -a and pass API URL' \
        " [-a https://www.newapi.com/]\n"
      print '>>'
    end

    def self.display_output_label(label)
      print "\n#{label}:\n"
    end

    def self.display_stock_info(date, close, low, high)
      print output_message(date, close, low, high) + "\n"
    end

    def self.display_return(
      value_difference,
      percent_return,
      initial_value,
      final_value,
      date
    )
      print "\n" + return_message(
        value_difference,
        percent_return,
        initial_value,
        final_value,
        date
      ) + "\n"
    end

    def self.display_drawdowns(drawdown, high, low, date)
      print drawdowns_message(drawdown, high, low, date) + "\n"
    end

    def self.display_max_drawdown(drawdown, high, low, date)
      print "\n" + max_drawdown_message(drawdown, high, low, date) + "\n"
    end

    def self.display_output_option_message
      print "Send output to mail box? Yes? Enter email address, No? Type exit\n"
      print '>>'
    end

    def self.display_success_message
      print "Success!!! Bye!\n"
    end

    def self.display_exit_message
      print ":'( Exiting application...\n"
    end

    def self.display_error_message
      print 'Oops! Something went wrong. Please check your input format' \
        " or your API KEY (could be expired)\n"
    end
  end
end
