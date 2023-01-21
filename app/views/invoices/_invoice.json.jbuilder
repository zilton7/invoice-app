json.extract! invoice, :id, :client_id, :creation_date, :pay_until, :vat_method, :discount, :extra_stuff, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
