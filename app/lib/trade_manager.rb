class TradeManager
  attr_accessor :user_a, :item_list_a,
                :user_b, :item_list_b,
                :point_cache

  def initialize(offer_a, offer_b)
    @user_a = User.find(offer_a['user_id'])

    @item_list_a = offer_a['item_list']

    @user_b = User.find(offer_b['user_id'])
    @item_list_b = offer_b['item_list']

    @point_cache = {}

    # InfectedCantTrade

    validate
  end

  def is_fair_trade?
    sum_points(item_list_a) == sum_points(item_list_b)
  end

  def close_deal
    return unless is_fair_trade?

    ActiveRecord::Base.transaction do
      item_list_a.each do |item|
        user_a.forfeit_item(item['id'], item['quantity'])
        user_b.receive_item(item['id'], item['quantity'])
      end

      item_list_b.each do |item|
        user_a.receive_item(item['id'], item['quantity'])
        user_b.forfeit_item(item['id'], item['quantity'])
      end
    end
  end

  private

  def validate
    # validate user, items, availability 
  end

  def normalize
    # in case users are trying to trade the same items
  end

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
