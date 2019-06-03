require 'rails_helper'

RSpec.describe RowParser do
  let(:tds) { [:td, :td, :td] }
  let(:row) { double('row', css: tds) }
  let(:parser) { RowParser.new(row) }

  describe '#parse_row' do

    context 'with data' do
      it 'calls prepare_data' do
        expect(parser).to receive(:prepare_data).with(tds)
        parser.parse_row
      end
    end
  end

  describe '#get_tds_from_tr' do
    context 'with row' do
      it 'returns tds' do
        expect(parser.get_tds_from_tr).to eq(tds)
      end
    end
  end
end
