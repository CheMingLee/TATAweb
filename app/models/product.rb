class Product < ApplicationRecord
  scope :most_recent, -> { order(id: :desc) }
end
