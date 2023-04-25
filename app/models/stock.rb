class Stock < ApplicationRecord

  def self.new_lookup()
    client = IEX::Api::Client.new(publishable_token: 'pk_e68ccc999f3c4a3d8851b5919c8c04b8',
                                  endpoint: 'https://cloud.iexapis.com/v1')
  
    client.get('tops?symbols=snap', token: 'sk_c027ef096f864ea8b729e694e6a18470')
  end
  
end
 # [{'exchange' => 'NAS', ..., 'symbol' => 'AAPL'}, {'exchange' => 'ETR', ..., 'symbol' => 'APC-GY']