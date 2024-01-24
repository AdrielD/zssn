require 'rails_helper'

RSpec.context 'Services' do
  describe Users::Locate do
    let(:user) { create(:user) }
    let(:params) {{ id: user.id, lat: 45.00, lng: 127.00 }}

    it 'updates User lat and lng' do
      expect{ described_class.new(params).perform && user.reload }
        .to change{ user.lat }.from(user.lat).to(params[:lat].to_d)
        .and change{ user.lng }.from(user.lng).to(params[:lng].to_d)
    end

    context 'raises error on' do
      context 'lat' do
        let(:params_with_lat_outside_max_range) {{ id: user.id, lat: 91.00, lng: 127.00 }}
        let(:params_with_lat_outside_min_range) {{ id: user.id, lat: -91.00, lng: 127.00 }}

        it 'if more then permited range' do
          expect{ described_class.new(params_with_lat_outside_max_range).perform }
            .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Lat must be less than or equal to 90")
            .and not_change { user.lat }
        end

        it 'if less then permited range' do
          expect{ described_class.new(params_with_lat_outside_min_range).perform }
            .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Lat must be greater than or equal to -90")
            .and not_change { user.lat }
        end
      end

      context 'lng' do
        let(:params_with_lng_outside_max_range) {{ id: user.id, lat: 45.00, lng: 181.00 }}
        let(:params_with_lng_outside_min_range) {{ id: user.id, lat: 45.00, lng: -181.00 }}

        it 'if more then permited range' do
          expect{ described_class.new(params_with_lng_outside_max_range).perform }
            .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Lng must be less than or equal to 180")
            .and not_change { user.lng }
        end

        it 'if less then permited range' do
          expect{ described_class.new(params_with_lng_outside_min_range).perform }
            .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Lng must be greater than or equal to -180")
            .and not_change { user.lng }
        end
      end
    end
  end
end
