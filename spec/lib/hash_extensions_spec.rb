require "spec_helper"

RSpec.describe Hash do
  let(:hash) { { a: :b, c: { a: '1', d: :e } } }

  describe '#dig' do
    subject { hash.dig(*keys) }

    context 'first-level key' do
      let(:keys) { [:a] }
      it { is_expected.to eql(:b) }
    end

    context 'second-level key' do
      let(:keys) { [:c, :a] }
      it { is_expected.to eql('1') }
    end

    context 'non-existing key' do
      let(:keys) { [:c, :b] }
      it { is_expected.to be_nil }
    end
  end

  describe '#values_for' do
    subject { hash.values_for(key) }
    let(:key) { :a }
    it { is_expected.to be_a Array }
    it { is_expected.to match_array [:b, '1'] }

    context 'non-existing key' do
      let(:key) { :k }
      it { is_expected.to be_a Array }
      it { is_expected.to be_empty }
    end
  end
end
