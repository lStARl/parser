class GemsChecker
  attr_reader :parser,
              :inserted_ids

  def initialize(parser)
    @parser = parser
    @inserted_ids = []
  end

  def check
    while prepare_parser
      parse_data
      insert_data
      break unless last_inserted_data_present?
    end
    notify_users
  end

  def add_id(id)
    @inserted_ids << id
  end

  def last_inserted_data_present?
    inserted_ids.last.present?
  end

  private

  def prepare_parser
    parser_prepaper.prepare
  end

  def parse_data
    parser.parse
  end

  def insert_data
    resources_updater.update
  end

  def notify_users
    UsersNotifier.new(inserted_ids).notify
  end

  def parser_prepaper
    ParserPreparation.new(parser)
  end

  def resources_updater
    UpdateResources.new(parser, self)
  end
end