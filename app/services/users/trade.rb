class Users::Trade
  def initialize(params)
    @offer_a = params[:offer_a]
    @offer_b = params[:offer_b]
  end

  def perform
    tm = TradeManager.new(@offer_a, @offer_b)
    tm.close_deal
  end
end
