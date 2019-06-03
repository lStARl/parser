class UpdateResources
  attr_reader :parsed_data,
              :gem_checker

  def initialize(parser, gem_checker)
    @gem_checker = gem_checker
    @parsed_data = parser.parsed_data
  end

  def update
    parsed_data.each do |data|
      id = save_data(data)
      add_id(id)
      break unless id
    end
  end

  private

  def save_data(data)
    resource = Resource.new(data)
    resource.save
    resource.id
  end

  def add_id(data)
    gem_checker.add_id(data)
  end
end