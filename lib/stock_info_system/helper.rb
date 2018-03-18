# frozen_string_literal: true

require 'date'

module StockInfoSystem
  module Helper
    def self.user_input
      input = gets.chomp.split(' ')
      parse_input input
    end

    def self.get_hash_from_column_data(info)
      Hash[info.collect { |item| [item[0], item[1]] }]
    end

    def self.parse_date(date)
      Date.parse(date).strftime('%d-%m-%y')
    end

    class << self
      private

      def parse_input(input)
        parsed_input = {}
        parsed_input[:api_key] = input[0]
        parsed_input[:stock_symbol] = input[1]
        date = input[2..-1].join(' ').split('-')
        parsed_input[:start_date] = date[0]
        parsed_input[:end_date] = date.length > 1 ? date[1].strip : ''

        parsed_input
      end
    end
  end
end