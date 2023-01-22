class ExportInvoice
  include Prawn::View

  def initialize(invoice)
    @invoice = invoice
    @client = invoice.client

    content
  end

  def content
    text 'INVOICE'
    text "Invoice date: #{@invoice.creation_date}"
    text "Due date: #{@invoice.pay_until}"

    seller = %(SELLER

    Zilvinas Norvilis

    Company Code: 735695
    Address: Birutes 42-2, 87119 Telšiai
    )

    client = %(CLIENT

      #{@client.name}

      Company Code: #{@client.code}
      Address: #{@client.full_address}
    )

    data = [[seller, client]]

    table(data) do
    end

    # bounding_box([0, 650], width: 550, height: 200) do
    #   move_down 15
    #   text 'SELLER'
    #   text 'Zilvinas Norvilis'
    #   text 'Company Code: 735695'
    #   text 'Address: Birutes 42-2, 87119 Telšiai'
    #   stroke_bounds
    # end

    # text 'CLIENT'
    # text @invoice.client.name
    # text "Company Code: #{@client.code}"
    # text "Address: #{@client.full_address}"
  end
end
