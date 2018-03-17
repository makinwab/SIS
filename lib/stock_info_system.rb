# frozen_string_literal: true

require 'stock_info_system/version'
require 'stock_info_system/helper'
require 'stock_info_system/client'

# StockInfoSystem::Engine kickstarts the application
module StockInfoSystem
  class Engine
    def start
      print ">>"
      begin
        StockInfoSystem::Client.new(
          StockInfoSystem::Helper::user_input
        )
      rescue
        raise
      end
    end
  end
end