require "pStac/version"
require "Httparty"
module PStac
  class Error < StandardError; 



  end
  # Your code goes here...

  include Httparty

  base_uri 'paystack.com'

  def self.find(id)
  	get('/pay/realEst/#{id}.json')
  	
  end
end


pStac.find(0)
