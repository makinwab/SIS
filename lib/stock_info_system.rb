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
    def start
      StockInfoSystem::UI.display_start_message

      begin
        client = StockInfoSystem::Client.new(
          StockInfoSystem::Helper.user_input
        )

        client.get_stock_data

      rescue StandardError
        raise
      end
    end
  end
end
