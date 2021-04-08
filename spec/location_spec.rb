require 'spec_helper'

module Invite
  RSpec.describe Location do
    let(:party_location) { described_class.new('53.339428', '-6.257664') }

    describe 'Pi over 180' do
      subject { described_class::PI_OVER_180 }

      it { is_expected.to be_a Float }

      it { is_expected.to be_within(0.000001).of(0.017453) }
    end

    describe '#latitude' do
      subject { party_location.latitude }

      it { expect(subject).to be_a Float }

      it { expect(subject).to eql 53.339428 }
    end

    describe '#longitude' do
      subject { party_location.longitude }

      it { expect(subject).to be_a Float }

      it { expect(subject).to eql(-6.257664) }
    end

    describe '#degrees' do
      subject { party_location.degrees }

      it { is_expected.to all(be_a Float) }

      it 'returns coordinates in degrees' do
        is_expected.to eql [party_location.latitude, party_location.longitude]
      end
    end

    describe '#radians' do
      subject { party_location.radians }

      it { is_expected.to all(be_a Float) }

      it 'returns coordinates in radians' do
        lat = party_location.latitude * described_class::PI_OVER_180
        lng = party_location.longitude * described_class::PI_OVER_180

        is_expected.to eql [lat, lng]
      end
    end
  end
end
