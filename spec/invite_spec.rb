require 'spec_helper'

module Invite
  RSpec.describe Invite do
    context 'constants' do
      describe 'party location' do
        subject { Invite::PARTY_LOCATION }

        it { expect(subject).to be_a Location }

        its(:latitude) { is_expected.to eql Float('53.339428') }

        its(:longitude) { is_expected.to eql Float('-6.257664') }
      end
    end

    context '.invitations' do
      subject { Invite.invitations('customers.txt') }

      it { is_expected.not_to eql [] }

      it { is_expected.to all(be_a Customer) }

      it 'returns list of customers sorted by :user_id' do
        is_expected.to eql subject.sort_by(&:user_id)
      end
    end
  end
end
