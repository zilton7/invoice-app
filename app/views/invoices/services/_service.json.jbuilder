json.extract! service, :id, :name, :unit, :amount, :price, :vat, :invoice_id, :created_at, :updated_at
json.url service_url(service, format: :json)
