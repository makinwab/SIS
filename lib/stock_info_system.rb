# frozen_string_literal: true

require 'pry'

require 'stock_info_system/api'
require 'stock_info_system/client'
require 'stock_info_system/helper'
require 'stock_info_system/ui'
require 'stock_info_system/version'

module StockInfoSystem
  # Kickstart the application
  class Engine
    def initialize
      @ui = StockInfoSystem::UI
      @helper = StockInfoSystem::Helper

      @ui.display_start_message

      @client = StockInfoSystem::Client.new(
        @helper.user_input
      )
    end

    def start
      # display stock info
      @ui.display_output_label 'Output'
      client_stock_info

      # display first 3 drawdowns
      @ui.display_output_label 'First 3 Drawdowns'
      client_stock_drawdowns

      # display max drawdown
      @ui.display_max_drawdown(
        *@client.stock_max_drawdown
      )

      # display stock return
      @ui.display_return(
        *@client.stock_return_data
      )
    end

    private

    def client_stock_info
      @client.stock_data.each do |stock_info|
        @ui.display_stock_info(
          @helper.parse_date(stock_info['Date']),
          stock_info['Close'],
          stock_info['Low'],
          stock_info['High']
        )
      end
    end

    def client_stock_drawdowns
      drawdowns = @client.stock_drawdowns
      start = drawdowns.length > 3 ? drawdowns.length - 3 : 0

      drawdowns[start..-1].reverse.each do |value|
        @ui.display_drawdowns(
          value[0],
          value[2],
          value[3],
          value[1]
        )
      end
    end
  end
end
