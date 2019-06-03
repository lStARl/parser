require 'rails_helper'

RSpec.describe GemsChecker do
  let(:parser) { Parser.new }
  let(:checker) { GemsChecker.new(parser) }

  describe '#check' do
    it 'calls prepare_parser' do
      expect(checker).to receive(:prepare_parser)
      checker.check
    end

    it 'calls parse_data' do
      expect(checker).to receive(:parse_data).at_least(:once)
      checker.check
    end

    it 'calls insert_data' do
      expect(checker).to receive(:insert_data).at_least(:once)
      checker.check
    end

    it 'calls last_inserted_data_present?' do
      expect(checker).to receive(:last_inserted_data_present?).at_least(:once)
      checker.check
    end

    it 'calls notify_users' do
      expect(checker).to receive(:notify_users)
      checker.check
    end
  end

  describe 'add_data' do
    it 'adds data to list' do
      expected_data = [1]
      checker.add_data(1)
      expect(checker.data).to eq(expected_data)
    end
  end

  describe 'last_inserted_data_present?' do
    before do
      3.times { |n| checker.add_data(n + 1) }
    end

    context 'not nil' do
      it 'returns true' do
        expect(checker.last_inserted_data_present?).to be_truthy
      end
    end

    context 'nil' do
      before { checker.add_data(nil) }
      it 'returns false' do
        expect(checker.last_inserted_data_present?).to be_falsey
      end
    end
  end
end
