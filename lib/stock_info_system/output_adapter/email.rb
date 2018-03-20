# frozen_string_literal: true

require 'mail'

module StockInfoSystem
  module OutputAdapter
    # Handle sending output via email
    module Email
      module_function

      @ui = StockInfoSystem::UI
      @helper = StockInfoSystem::Helper

      def send(_data, user)
        setup_mailer

        Mail.deliver do
          from     ENV['USER_EMAIL']
          to       user
          subject  'Stock Information'
          html_part do
            content_type 'text/html; charset=UTF-8'
            body message
          end
        end
      end

      def setup_mailer
        options = {
          address: 'smtp.gmail.com',
          port: 587,
          user_name: ENV['USER_EMAIL'],
          password: ENV['USER_PASSWORD'],
          authentication: 'plain',
          enable_starttls_auto: true
        }

        Mail.defaults { delivery_method :smtp, options }
      end

      def message
        "
          <center>
            <h1>Stock Information</h1>
          </center>
          <h2>Output: </h2>
          #{prepare_stock_output data[:stock_info]}
          <h2>First 3 Drawdowns:</h2>
          #{prepare_drawdowns_output data[:drawdowns]}
          #{prepare_max_drawdown_output data[:max_drawdown]}
          #{prepare_return_output data[:stock_return]}
          "
      end

      def prepare_stock_output(data)
        output = ''
        data.each do |stock_info|
          output += '<p>' + @ui.output_message(
            @helper.parse_date(stock_info[0]),
            stock_info[3],
            stock_info[2],
            stock_info[1]
          ) + '</p>'
        end

        output
      end

      def prepare_drawdowns_output(data)
        output = ''
        data.each do |stock_info|
          output += '<p>' + @ui.drawdowns_message(
            stock_info[0],
            stock_info[1],
            stock_info[2],
            @helper.parse_date(stock_info[3])
          ) + '</p>'
        end

        output
      end

      def prepare_max_drawdown_output(data)
        output = ''
        output += '<h2>' + @ui.max_drawdown_message(
          data[0],
          data[1],
          data[2],
          @helper.parse_date(data[3])
        ) + '</h2>'

        output
      end

      def prepare_return_output(data)
        output = ''
        output += '<h2>' + @ui.return_message(
          data[0],
          data[1],
          data[2],
          data[3],
          data[4]
        ) + '</h2>'

        output
      end
    end
  end
end
