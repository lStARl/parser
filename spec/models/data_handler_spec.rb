require 'rails_helper'

RSpec.describe DataHandler, type: :model do
  let(:td) { double('td', css: [{'href' => 'localhost'}], text: 'text') }
  let(:td_blocks) { [td, td, td] }
  let(:handler) { DataHandler.new(td_blocks) }
  let(:link) { { link: 'link' } }
  let(:data) { { text: 'text' } }

  describe '#set_data' do
    it 'stores data to the hash' do
      handler.set_data(:text, data)
      expect(handler.data).to eq(data)
    end
  end

  describe '#set_link' do
    it 'stores data with link to the hash' do
      handler.set_link(link)
      expect(handler.data).to eq(link)
    end
  end

  describe '#prepare_data' do
    it 'calls parse_td' do
      expect(handler).to receive(:parse_td).at_least(3).and_return(data)
      handler.prepare_data
    end

    it 'calls set_data' do
      expect(handler).to receive(:set_data).at_least(3)
      handler.prepare_data
    end

    it 'calls set_link' do
      expect(handler).to receive(:set_link).at_least(3)
      handler.prepare_data
    end

    it 'stores data to the hash' do
      handler.prepare_data
      expect(handler.data).to be_present
    end
  end
end
