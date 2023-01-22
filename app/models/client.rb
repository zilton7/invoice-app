class Client < ApplicationRecord
  def full_address
    "#{address} #{city}"
  end
end
