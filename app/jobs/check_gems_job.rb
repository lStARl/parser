class CheckGemsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    parser = Parser.new
    GemsChecker.new(parser).check
  end
end
