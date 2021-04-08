require 'spec_helper'

module Invite
  RSpec.describe Customer do
    let(:customer_hash) do
      {
        'user_id' => '1',
        'name' => 'Elizabeth Alexandra Mary',
        'latitude' => '51.5014',
        'longitude' => '0.1419'
      }
    end

    let(:customer) { described_class.new(customer_hash) }

    let(:remote_location) { Location.new('53.339428', '-6.257664') }

    subject { customer }

    describe '#user_id' do
      its(:user_id) { is_expected.to eql '1' }
    end

    describe '#name' do
      its(:name) { is_expected.to eql 'Elizabeth Alexandra Mary' }
    end

    describe '#location' do
      subject { customer.location }

      it { is_expected.to be_a(Location) }

      its(:latitude) { is_expected.to eql 51.5014 }

      its(:longitude) { is_expected.to eql 0.1419 }
    end

    describe '#to_h' do
      subject { customer.to_h }

      it { is_expected.to be_a Hash }

      it { is_expected.to include(user_id: '1') }

      it { is_expected.to include(name: 'Elizabeth Alexandra Mary') }
    end

    describe '#distance_from' do
      subject { customer.distance_from(remote_location) }

      it 'returns distance in km calculated by Distance.distance' do
        expect(Distance).to receive(:distance)
          .with(remote_location, customer.location)
          .and_return(10)

        is_expected.to eql 10
      end
    end

    describe '#in_range?' do
      subject { customer.in_range?(100, remote_location) }

      context 'when remote location is within given maximum in km' do
        before do
          expect(customer).to receive(:distance_from)
            .with(remote_location)
            .and_return(50)
        end

        it { is_expected.to be true }
      end

      context 'when remote location is exacly in the allowed distance' do
        before do
          expect(customer).to receive(:distance_from)
            .with(remote_location)
            .and_return(100)
        end

        it { is_expected.to be true }
      end

      context 'when remote location is not within given maximum in km' do
        before do
          expect(customer).to receive(:distance_from)
            .with(remote_location)
            .and_return(101)
        end

        it { is_expected.to be false }
      end
    end
  end
end
