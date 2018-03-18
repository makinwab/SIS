# frozen_string_literal: true

module Fixture
  USER_INPUT = 'API_KEY=xxxx AAPL Jan 1, 2018 - Jan 2, 2018'.freeze
  BAD_USER_INPUT = 'baduserinpput'.freeze
  PARSED_USER_INPUT = {
    api_key: 'API_KEY=xxxx',
    stock_symbol: 'AAPL',
    start_date: 'Jan 1, 2018 ',
    end_date: 'Jan 2, 2018'
  }.freeze

  DATASET = {
    'column_names' => [
      'Date',
      'Open',
      'High',
      'Low',
      'Close',
      'Volume',
      'Ex-Dividend',
      'Split Ratio'
    ],
    'start_date' => '2018-01-01',
    'end_date' => '2018-01-02',
    'data' => [
      [
        '2018-01-02',
        170.16,
        172.3,
        169.26,
        172.26,
        25_048_048.0,
        0.0,
        1.0
      ]
    ]
  }.freeze

  ZIPPED_DATASET = {
    'Date' => '2018-01-02',
    'Open' => 170.16,
    'High' => 172.3,
    'Low' => 169.26,
    'Close' => 172.26,
    'Volume' => 25_048_048.0,
    'Ex-Dividend' => 0.0,
    'Split Ratio' => 1.0
  }.freeze
end
