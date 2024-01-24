require 'rails_helper'

RSpec.context 'Services' do
  # describe Users::Trade do
  #   let(:user_a) { create(:user, :with_item_x10) }
  #   let(:user_b) { create(:user, :with_item_x5) }

  #   it 'execute trades between two users' do
  #     expect{ described_class.new(offer_a, offer_b).perform }
  #       .to change{ user_a.reload.inventory.first.item.id }.from(item_a.id).to(item_b.id)
  #       .and change{ user_b.reload.inventory.first.id }.from(item_b.id).to(item_a.id)
  #   end
  # end

  describe Users::Trade do
    let(:user_a) { create(:user) }
    let(:user_b) { create(:user) }
    let(:item_a) { create(:item, points: 1) }
    let(:item_b) { create(:item, points: 2) }
    let(:offer_a) {{ user_id: user_a.id, item_list:[{ id: item_a.id, quantity: 10 }] }}
    let(:offer_b) {{ user_id: user_b.id, item_list:[{ id: item_b.id, quantity: 5 }] }}

    it 'execute trades between two users' do
      UserItem.create(user_id: user_a.id, item_id: item_a.id, amount: 10)
      UserItem.create(user_id: user_b.id, item_id: item_b.id, amount: 5)

      expect{ described_class.new(offer_a, offer_b).perform }
        .to change{ user_a.reload.inventory.first.item.id }.from(item_a.id).to(item_b.id)
        .and change{ user_b.reload.inventory.first.item.id }.from(item_b.id).to(item_a.id)
    end
  end
end
