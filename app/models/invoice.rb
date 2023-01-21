class Invoice < ApplicationRecord
  belongs_to :client

  has_many :services

  accepts_nested_attributes_for :services

  store_accessor :extra_stuff, :written_by, :notes
end
