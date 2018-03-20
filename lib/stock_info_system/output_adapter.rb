# frozen_string_literal: true

module StockInfoSystem
  # Handle different forms of output delivery
  module OutputAdapter
    module_function

    def send_output(data, user)
      adapter.send(data, user)
    end

    def adapter
      return @adapter if @adapter
      self.adapter = :email
      @adapter
    end

    def adapter=(adapter)
      require "stock_info_system/output_adapter/#{adapter}"
      @adapter = StockInfoSystem::OutputAdapter.const_get(
        adapter.to_s.capitalize
      )
    end
  end
end
