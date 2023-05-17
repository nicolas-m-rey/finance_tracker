class Stock < ApplicationRecord
 has_many :user_stocks
 has_many :users, through: :user_stocks

 validates :stock, :sector, presence: true

  def self.new_lookup(stock)
    client = IEX::Api::Client.new(publishable_token: ENV['publishable_api_key'],
                                  endpoint: 'https://cloud.iexapis.com/v1')
  
  begin

    
    bundle = client.get("tops?symbols=#{stock}", token: ENV['secret_api_key'])


    bundle = bundle[0]
  
    symbol = bundle["symbol"]

    sector = bundle["sector"]

    last_sale_price = bundle["lastSalePrice"]

    new(stock: symbol, sector: sector, last_price: last_sale_price)

    # return result = [symbol, sector, last_sale_price]
    
    rescue => exception 
      return false
    end
  end

  def self.check_db(stock)
    where(stock: stock).first
  end
  
end


