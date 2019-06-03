require 'open-uri'

class Parser
  URL = 'https://rubysec.com/advisories/'

  attr_accessor :page,
                :parsed_data

  def initialize
    @parsed_data = []
  end

  def parse
    rows = get_rows
    return unless rows
    self.parsed_data = parse_rows(rows)
  end

  def get_rows
    return unless page
    page.css('tr')
  end

  def get_next_link
    return URL unless page
    page.css('li.next a').last
  end

  def parse_rows(rows)
    rows.map { |row| parse_row(row) }
  end

  private

  def parse_row(row)
    RowParser.new(row).parse_row
  end
end