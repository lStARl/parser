class TdParser
  attr_reader :td

  def initialize(td)
    @td = td
  end

  def parse
    { text: get_text, link: title_link }
  end

  def get_link
    return unless td
    link = td.try(:css, 'a')
    link.try(:last)
  end

  def get_text
    return unless td
    text = td.try(:text)
    text.try(:strip)
  end

  def title_link
    link = get_link
    return unless link
    return link['href']
  end
end