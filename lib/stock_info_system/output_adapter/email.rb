module StockInfoSystem
  module OutputAdapter
    module Email
      extend self

      def send(data, user)
        p data, user
      end

      def prepare_output
      end
    end
  end
end