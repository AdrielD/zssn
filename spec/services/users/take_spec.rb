require 'rails_helper'

RSpec.context 'Services' do
  describe Users::Take do
    let(:user) { create(:user) }
    let(:item) { create(:item) }
    let(:params) {{ id: user.id, item_id: item.id, quantity: 1 }}

    it 'takes item from user' do
      UserItem.create(user_id: user.id, item_id: item.id, amount: 1)

      expect{ described_class.new(params).perform }
        .to change{ user.reload.inventory.size }.by(-1)
    end

    context 'for infected user' do
      let(:user) { create(:user, :infected) }

      it 'does not take the item' do
        UserItem.create(user_id: user.id, item_id: item.id, amount: 1)

        expect{ described_class.new(params).perform }
          .to raise_error(UserExceptions::InfectedCantTrade)
          .and not_change { user.reload.user_items.size }
      end
    end
  end
end
