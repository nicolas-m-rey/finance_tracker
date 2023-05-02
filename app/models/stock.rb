class Stock < ApplicationRecord

  def self.new_lookup(stock)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:publishable_api_key],
                                  endpoint: 'https://cloud.iexapis.com/v1')
  
  begin
    bundle = client.get("tops?symbols=#{stock}", token: Rails.application.credentials.iex_client[:secret_api_key])
  rescue => exception 
    return nil 
  end

    bundle = bundle[0]
  
    symbol = bundle["symbol"]

    sector = bundle["sector"]

    last_sale_price = bundle["lastSalePrice"]

    return result = [symbol, sector, last_sale_price]


  end
  
end
 

