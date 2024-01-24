require 'rails_helper'

RSpec.context 'Services' do
  describe Users::Create do
    let(:params) { attributes_for(:user) }

    it 'saves a new User' do
      expect{ described_class.new(params).perform }
        .to change { User.count }.by(1)
    end

    context 'raises error on' do
      context 'name' do
        let(:params_with_empty_name) { attributes_for(:user, name: '') }
        
        it 'if empty' do
          expect{ described_class.new(params_with_empty_name).perform }
            .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Name can't be blank")
            .and not_change { User.count }
        end
      end

      context 'age' do
        let(:params_with_bad_age) { attributes_for(:user, age: 'abc') }

        it 'if not a valid number' do
          expect{ described_class.new(params_with_bad_age).perform }
            .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Age must be greater than 0")
            .and not_change { User.count }
        end
      end

      context 'gender' do
        let(:params_with_inexistent_gender) { attributes_for(:user, gender: 'asdasd') }

        it 'if not from predefined values' do
          expect{ described_class.new(params_with_inexistent_gender).perform }
            .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Gender is not included in the list")
            .and not_change { User.count }
        end
      end

      context 'lat' do
        let(:params_with_lat_outside_max_range) { attributes_for(:user, lat: 91.5) }
        let(:params_with_lat_outside_min_range) { attributes_for(:user, lat: -91.5) }

        it 'if more then permited range' do
          expect{ described_class.new(params_with_lat_outside_max_range).perform }
            .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Lat must be less than or equal to 90")
            .and not_change { User.count }
        end

        it 'if less then permited range' do
          expect{ described_class.new(params_with_lat_outside_min_range).perform }
            .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Lat must be greater than or equal to -90")
            .and not_change { User.count }
        end
      end

      context 'lng' do
        let(:params_with_lng_outside_max_range) { attributes_for(:user, lng: 180.5) }
        let(:params_with_lng_outside_min_range) { attributes_for(:user, lng: -180.5) }

        it 'if more then permited range' do
          expect{ described_class.new(params_with_lng_outside_max_range).perform }
            .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Lng must be less than or equal to 180")
            .and not_change { User.count }
        end

        it 'if less then permited range' do
          expect{ described_class.new(params_with_lng_outside_min_range).perform }
            .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Lng must be greater than or equal to -180")
            .and not_change { User.count }
        end
      end
    end
  end
end
