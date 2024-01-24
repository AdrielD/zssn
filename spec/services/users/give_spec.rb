require 'rails_helper'

RSpec.context 'Services' do
  describe Users::Give do
    let(:user) { create(:user) }
    let(:item) { create(:item) }
    let(:params) {{ id: user.id, item_id: item.id, quantity: 10 }}

    it 'gives user an item' do
      expect{ described_class.new(params).perform }
        .to change{ user.reload && user.inventory.size }.by(1)
    end

    context 'for infected user' do
      let(:user) { create(:user, :infected) }

      it 'does not give item' do
        expect{ described_class.new(params).perform }
          .to raise_error(UserExceptions::InfectedCantTrade)
          .and not_change { user.reload && user.user_items.size }
      end
    end
  end
end
