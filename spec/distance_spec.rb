require 'spec_helper'

module Invite
  RSpec.describe Distance do
    let(:party) { Location.new('53.339428', '-6.257664') }

    let(:wicklow) { Location.new('52.986375', '-6.043701') }
    let(:dingle)  { Location.new('51.92893', '-10.27699') }
    let(:kilkenny) { Location.new('52.65047', '-7.24929') }

    context 'constants' do
      describe 'Earth radius in km' do
        subject { described_class::EARTH_RADIUS_KM }

        it { is_expected.to be_a Float }

        it { is_expected.to eql 6371.0 }
      end
    end

    describe '.distance' do
      let(:hundred_m) { 0.1 }

      context 'calculates distance between two identical locations' do
        subject { described_class.distance(party, party) }

        it { is_expected.to be_a Float }

        it { is_expected.to eql 0.0 }
      end

      context 'calculates distance between party and Wicklow' do
        subject { described_class.distance(party, wicklow) }

        it { is_expected.to be_a Float }

        it { is_expected.to be_within(hundred_m).of(41.7) }
      end

      context 'calculates distance between party and Dingle' do
        subject { described_class.distance(party, dingle) }

        it { is_expected.to be_a Float }

        it { is_expected.to be_within(hundred_m).of(313.2) }
      end

      context 'calculates distance between party and Kilkenny' do
        subject { described_class.distance(party, kilkenny) }

        it { is_expected.to be_a Float }

        it { is_expected.to be_within(hundred_m).of(101.3) }
      end
    end
  end
end
