class Users::Trade
  def initialize(offer_a, offer_b)
    @offer_a = offer_a
    @offer_b = offer_b
  end

  def perform
    tm = TradeManager.new(@offer_a, @offer_b)
    tm.close_deal
  end
end
