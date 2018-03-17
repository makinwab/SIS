module StockInfoSystem
  module Helper
    def self.user_input
      input = gets.chomp.split(" ")
      parse_input input
    end

    private

    def self.parse_input(input)
      parsed_input = {}
      parsed_input[:api_key] = input[0]
      parsed_input[:stock_symbol] = input[1]
      date = input[2..-1].join(" ").split("-")
      parsed_input[:start_date] = date[0]
      parsed_input[:end_date] = date.length > 1 ? date[1].strip : ""

      parsed_input
    end
  end
end