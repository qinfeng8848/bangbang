class WelcomeController < ApplicationController

  def index

    client_public = PeatioAPI::Client.new endpoint: 'https://yunbi.com'
    response = client_public.get_public '/api/v2/tickers'
    @zec_yunbi = response["zeccny"]["ticker"]["sell"]
    @etc_yunbi = response["etccny"]["ticker"]["sell"]
    @eth_yunbi = response["ethcny"]["ticker"]["sell"]
    @sc_yunbi = response["sccny"]["ticker"]["sell"]
  end
end
