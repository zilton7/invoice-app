class Invoice < ApplicationRecord
  belongs_to :client

  has_many :services

  accepts_nested_attributes_for :services, reject_if: :all_blank, allow_destroy: true

  store_accessor :extra_stuff, :written_by, :notes
end
