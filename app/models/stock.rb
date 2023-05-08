class Stock < ApplicationRecord
 has_many :user_stocks
 has_many :users, through: :user_stocks

 validates :name, :stock, presence: true

  def self.new_lookup(stock)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:publishable_api_key],
                                  endpoint: 'https://cloud.iexapis.com/v1')
  
  begin
    bundle = client.get("tops?symbols=#{stock}", token: Rails.application.credentials.iex_client[:secret_api_key])


    bundle = bundle[0]
  
    symbol = bundle["symbol"]

    sector = bundle["sector"]

    last_sale_price = bundle["lastSalePrice"]

    return result = [symbol, sector, last_sale_price]
    
    rescue => exception 
      return false
    end

  end
  
end
 

