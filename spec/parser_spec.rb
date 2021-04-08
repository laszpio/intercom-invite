require 'spec_helper'

module Invite
  RSpec.describe Parser do
    let(:sample_input) { described_class.new('customers.txt') }

    describe 'initialize' do
      context "source file doesn't exist" do
        subject { described_class.new('no-such-file.txt') }

        it do
          error_message = "Can't locate source file: no-such-file.txt."
          expect { subject }.to raise_error(RuntimeError, error_message)
        end
      end
    end

    describe '#filename' do
      context 'with existing filen' do
        subject { sample_input.filename }

        it { is_expected.to eql 'customers.txt' }
      end

      context 'with non-existing source file'
    end

    describe '#customers' do
      context 'with sample customers file' do
        subject { sample_input.customers }

        its(:length) { is_expected.to be(32) }

        it { is_expected.to all(be_an(Customer)) }
      end
    end
  end
end
