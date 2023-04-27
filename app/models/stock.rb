class Stock < ApplicationRecord

  def self.new_lookup(stock)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:publishable_api_key],
                                  endpoint: 'https://cloud.iexapis.com/v1')
  
    client.get("tops?symbols=#{stock}", token: Rails.application.credentials.iex_client[:secret_api_key])
  end
  
end
 # [{'exchange' => 'NAS', ..., 'symbol' => 'AAPL'}, {'exchange' => 'ETR', ..., 'symbol' => 'APC-GY']