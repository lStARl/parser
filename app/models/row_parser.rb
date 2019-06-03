class RowParser
  attr_reader :row

  def initialize(row)
    @row = row
  end

  def parse_row
    td_blocks = get_tds_from_tr
    prepare_data(td_blocks)
  end

  def get_tds_from_tr
    return unless row
    row.try(:css, 'td')
  end

  private

  def prepare_data(td_blocks)
    return unless td_blocks
    DataHandler.new(td_blocks).prepare_data
  end
end