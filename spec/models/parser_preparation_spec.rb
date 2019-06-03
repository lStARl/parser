require 'rails_helper'

RSpec.describe ParserPreparation do
  let(:parser) { Parser.new }
  let(:prepaper) { ParserPreparation.new(parser) }
  let(:nokogiri_result) { double('nokogiri') }

  describe '#prepare' do
    context 'without next page' do
      before { allow(prepaper).to receive(:next_page_link).and_return(nil) }
      it 'returns nil' do
        expect(prepaper.prepare).to be_nil
      end
    end

    context 'with next page' do
      before { allow(prepaper).to receive(:fetch_data_from_source).and_return(nokogiri_result) }

      it 'calls set_parser_page' do
        expect(prepaper).to receive(:set_parser_page).with(nokogiri_result)
        prepaper.prepare
      end
    end
  end

  describe '#fetch_data_from_source' do
    it 'calls Nokogiri::HTML' do
      expect(Nokogiri).to receive(:HTML)
      prepaper.prepare
    end
  end
end
