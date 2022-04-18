class Technology < ApplicationRecord
  validates_presence_of :name
  belongs_to :portfolio
end
