json.extract! client, :id, :name, :code, :vat_code, :address, :city, :post_code, :country, :website, :phone, :fax, :email, :notes, :created_at, :updated_at
json.url client_url(client, format: :json)
