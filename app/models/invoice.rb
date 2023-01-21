class Invoice < ApplicationRecord
  belongs_to :client

  has_many :services

  store_accessor :extra_stuff, :written_by, :notes
end
