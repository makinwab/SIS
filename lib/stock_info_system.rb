# frozen_string_literal: true

require 'pry'

require 'stock_info_system/api'
require 'stock_info_system/client'
require 'stock_info_system/helper'
require 'stock_info_system/ui'
require 'stock_info_system/version'


# StockInfoSystem::Engine kickstarts the application
module StockInfoSystem
  class Engine
    def initialize
      @ui = StockInfoSystem::UI
      @helper = StockInfoSystem::Helper
    end

    def start
      @ui.display_start_message

      begin
        client = StockInfoSystem::Client.new(
          @helper.user_input
        )

        # display stock info
        client_stock_info client

      rescue StandardError
        raise
      end
    end

    private

    def client_stock_info(client)
      client.get_stock_data.each do |stock_info|
        @ui.display_stock_info_output(
          @helper.parse_date(stock_info['Date']),
          stock_info['Close'],
          stock_info['Low'],
          stock_info['High']
        )
      end
    end
  end
end
