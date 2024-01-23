class TradeManager
  attr_accesor :user_a, :item_list_a,
               :user_b, :item_list_b,
               :point_cache

  def initialize(offer_a, offer_b)
    @user_a_id = offer_a.user_id
    @item_list_a = offer_a.item_list

    @user_b_id = offer_b.user_id
    @item_list_b = offer_b.item_list

    @point_cache = {}

    # InfectedCantTrade
  end

  def is_fair_trade?
    sum_points(item_list_a) == sum_points(item_list_b)
  end

  def close_deal
  end

  private

  def sum_points(list)
    list.reduce(0) do |acc, unit|
      if (point_cache[unit['id']])
        points = point_cache[unit['id']]
      else
        item = Item.find(unit['id'])
        points = item.points
        point_cache[unit['id']] = points
      end
      acc + points * unit['quantity']
    end
  end
end
