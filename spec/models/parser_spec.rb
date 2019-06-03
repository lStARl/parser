require 'rails_helper'

RSpec.describe Parser do
  let(:page) { double('page', css: true) }
  let(:parser) { Parser.new }
  let(:css) { double('css', css: true ) }

  describe '#parse' do
    before { parser.page = page }
    context 'without rows' do
      before { allow(parser).to receive(:get_rows).and_return(nil) }
      it 'returns nil' do
        expect(parser.parse).to be_nil
      end
    end

    context 'with rows' do
      it 'calls #parse_rows' do
        expect(parser).to receive(:parse_rows)
        parser.parse
      end

      context 'with parsed data' do
        result = [1,2,3,4]
        before { allow(parser).to receive(:parse_rows).and_return(result) }
        it 'saves data' do
          parser.parse
          expect(parser.parsed_data).to eq(result)
        end
      end
    end
  end

  describe '#get_rows' do
    context 'without page' do
      it 'returns nil' do
        expect(parser.get_rows).to be_nil
      end
    end

    context 'with page' do
      before { parser.page = page }
      it 'calls css' do
        expect(page).to receive(:css).with('tr')
        parser.get_rows
      end
    end
  end

  describe '#get_next_link' do
    context 'without page' do
      url = Parser::URL
      it 'returns default URL' do
        expect(parser.get_next_link).to eq(url)
      end
    end

    context 'with page' do
      before { parser.page = page }
      it 'calls css' do
        expect(page).to receive(:css).with('li.next a').and_return(['link'])
        parser.get_next_link
      end
    end
  end
end
