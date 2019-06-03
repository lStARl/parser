class DataHandler
  PUBLISHED_DATE = '0'
  RUBYGEM = '1'
  TITLE = '2'
  CVE = '3'

  attr_reader :td_blocks,
              :data

  def initialize(td_blocks)
    @td_blocks = td_blocks
    @data = {}
  end

  def prepare_data
    td_blocks.each_with_index do |td, i|
      data = parse_td(td)
      key = key(i)
      set_data(key, data)
      set_link(data)
    end
    data
  end

  def set_data(key, data)
    @data[key] = data[:text]
  end

  def set_link(data)
    return unless data[:link].present?
    @data[:link] = data[:link]
  end

  private

  def parse_td(td)
    TdParser.new(td).parse
  end

  def key(i)
    keys[i.to_s]
  end

  def keys
    {
        PUBLISHED_DATE => :published_date,
        RUBYGEM => :rubygem,
        TITLE => :title,
        CVE => :cve
    }
  end
end