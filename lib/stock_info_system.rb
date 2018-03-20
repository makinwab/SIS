# frozen_string_literal: true

require 'dotenv'
Dotenv.load

require 'stock_info_system/api'
require 'stock_info_system/client'
require 'stock_info_system/helper'
require 'stock_info_system/output_adapter'
require 'stock_info_system/ui'
require 'stock_info_system/version'

module StockInfoSystem
  # Kickstart the application
  class Engine
    attr_accessor :results

    def initialize
      @results = {}
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
      @results[:max_drawdown] = @client.stock_max_drawdown
      @ui.display_max_drawdown(
        *@results[:max_drawdown]
      )

      # display stock return
      @results[:stock_return] = @client.stock_return_data
      @ui.display_return(
        *@results[:stock_return]
      )

      delivery_option
    end

    private

    def delivery_option
      return unless results

      @ui.display_output_option_message
      user_input = gets.chomp
      if user_input =~ @helper::VALID_EMAIL_REGEX
        StockInfoSystem::OutputAdapter.send_output(
          @results, user_input
        )
        @ui.display_success_message
      else
        @ui.display_exit_message
        abort
      end
    end

    def client_stock_info
      @results[:stock_info] = []
      @client.stock_data.each do |stock_info|
        info = [
          @helper.parse_date(stock_info['Date']),
          stock_info['Close'],
          stock_info['Low'],
          stock_info['High']
        ]

        @results[:stock_info].push(info)
        @ui.display_stock_info(
          *info
        )
      end
    end

    def client_stock_drawdowns
      drawdowns = @client.stock_drawdowns
      start = drawdowns.length > 3 ? drawdowns.length - 3 : 0
      @results[:drawdowns] = []

      drawdowns[start..-1].reverse.each do |value|
        @results[:drawdowns].push(
          [
            value[0],
            value[2],
            value[3],
            value[1]
          ]
        )
        @ui.display_drawdowns(
          *@results[:drawdowns][-1]
        )
      end
    end
  end
end
