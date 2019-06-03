require 'rails_helper'

RSpec.describe TdParser, type: :model do
  let(:td) { double('td', css: [:link], text: 'text' ) }
  let(:parser) { TdParser.new(td) }

  describe '#parse' do
    it 'calls get_text' do
      expect(parser).to receive(:get_text)
      parser.parse
    end

    it 'calls title_link' do
      expect(parser).to receive(:title_link)
      parser.parse
    end
  end

  describe '#get_text' do
    it 'returns text' do
      expect(parser.get_text).to eq(td.text)
    end
  end

  describe '#get_link' do
    it 'returns link' do
      expect(parser.get_link).to eq(td.css.last)
    end
  end

  describe '#title_link' do
    it 'calls get_link' do
      expect(parser).to receive(:get_link)
      parser.title_link
    end

    context 'with link' do
      before { allow(parser).to receive(:get_link).and_return({'href' => 'localhost'}) }
      it 'returns a link' do
        expect(parser.title_link).to eq('localhost')
      end
    end
  end
end
