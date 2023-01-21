class Service < ApplicationRecord
  belongs_to :invoice

  attr_accessor :total

  enum unit: { unit: 0, hour: 1, month: 2, year: 3 }
end
