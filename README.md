# README

This is the finance tracker app from the Complete Ruby on Rails Developer course

Deployed to - https://finance-tracker-udemy.herokuapp.com


class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: 'pk_e68ccc999f3c4a3d8851b5919c8c04b8',
                                  endpoint: 'https://cloud.iexapis.com/v1')
    client.lastPrice(ticker_symbol)
  end

end





  require 'net/http'
  def self.price()
    uri = URI('https://api.iex.cloud/v1/data/CORE/IEX_TOPS/AAPL?token=pk_e68ccc999f3c4a3d8851b5919c8c04b8')
    address = Net::HTTP.get(uri).to_json
    print address["lastSalePrice"][5]
  end