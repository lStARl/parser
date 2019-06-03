class LinkGenerator
  attr_reader :parser

  def initialize(parser)
    @parser = parser
  end

  def generate
    link = get_next_link
    return unless link
    default_url + check_link(link)
  end

  private

  def check_link(link)
    return unless link
    is_default_url?(link) ? '' : generate_link(link)
  end

  def generate_link(link)
    '?' + link['href'].split('?').last
  end

  def get_next_link
    parser.get_next_link
  end

  def default_url
    Parser::URL
  end

  def is_default_url?(link)
    link == default_url
  end
end