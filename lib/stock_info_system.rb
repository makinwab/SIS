# frozen_string_literal: true

require 'pry'

require 'stock_info_system/version'
require 'stock_info_system/helper'
require 'stock_info_system/client'
require 'stock_info_system/api'

# StockInfoSystem::Engine kickstarts the application
module StockInfoSystem
  class Engine
    def start
      print '>>'
      begin
        StockInfoSystem::Client.new(
          StockInfoSystem::Helper.user_input
        )
      rescue StandardError
        raise
      end
    end
  end
end
