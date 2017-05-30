class WelcomeController < ApplicationController

  def index

    @usdt_zec = Poloniex::Market.by_pair("USDT_ZEC").last
    @usdt_eth = Poloniex::Market.by_pair("USDT_ETH").last
    @usdt_etc = Poloniex::Market.by_pair("USDT_ETC").last
    @usdt_sc = Poloniex::Market.by_pair("BTC_SC").last.to_f * Poloniex::Market.by_pair("USDT_BTC").last.to_f
    # @exchange_rate = Money.default_bank.get_rate('USD','CNY').to_f

    client_public = PeatioAPI::Client.new endpoint: 'https://yunbi.com'
    response = client_public.get_public '/api/v2/tickers'
    @zec_yunbi = response["zeccny"]["ticker"]["sell"]
    @etc_yunbi = response["etccny"]["ticker"]["sell"]
    @eth_yunbi = response["ethcny"]["ticker"]["sell"]
    @sc_yunbi = response["sccny"]["ticker"]["sell"]
  end
end
