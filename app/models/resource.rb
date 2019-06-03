class Resource < ApplicationRecord
  paginates_per 30

  validates :link, uniqueness: true
end
