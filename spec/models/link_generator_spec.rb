require 'rails_helper'

RSpec.describe LinkGenerator, type: :model do
  let(:parser) { Parser.new }
  let(:generator) { LinkGenerator.new(parser) }
  let(:url) { Parser::URL }
  let(:link_object) { { 'href' => 'link?page=2' } }

  describe '#generate' do
    context 'without next link' do
      before { expect(generator).to receive(:get_next_link).and_return(false) }
      it 'returns nil' do
        expect(generator.generate).to be_nil
      end
    end

    context 'with next link' do
      context 'equals default link' do
        before { expect(generator).to receive(:get_next_link).and_return(url) }
        it 'returns default link' do
          expect(generator.generate).to eq(url)
        end
      end

      context 'not equals default link' do
        before { expect(generator).to receive(:get_next_link).and_return(link_object) }
        it 'returns next link' do
          result = "#{url}?page=2"
          expect(generator.generate).to eq(result)
        end
      end
    end
  end
end
