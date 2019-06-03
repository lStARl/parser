class ParserPreparation
  attr_reader :parser

  def initialize(parser)
    @parser = parser
  end

  def prepare
    return unless next_page_link
    page = fetch_data_from_source(next_page_link)
    set_parser_page(page)
  end

  def fetch_data_from_source(source)
    Nokogiri::HTML(open(source))
  end

  private

  def link_generator
    LinkGenerator.new(parser)
  end

  def next_page_link
    @link ||= link_generator.generate
  end

  def set_parser_page(page)
    parser.page = page
  end
end