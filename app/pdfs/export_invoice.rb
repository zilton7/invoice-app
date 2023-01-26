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

    seller_name = %(SELLER

    Zilvinas Norvilis
    )

    seller_info = %(
      Company Code: 735695
      Address: Birutes 42-2, 87119 Telšiai
    )

    client_name = %(CLIENT

      #{@client.name}
    )

    code = text "<b>#{@client.code}</b>", inline_format: true

    client_info = %(
      Company Code: #{code}
      Address: #{@client.full_address}
    )

    # data = [[seller_name, client_name], [seller_info, client_info]]

    # table(data) do
    #   row(0).font_style = :bold
    #   row(0).columns(0..1).borders = %i[top left right]
    #   row(1).columns(0..1).borders = %i[bottom left right]
    # end

    bounding_box([0, 650], width: 275, height: 200) do
      move_down 15
      text 'SELLER'
      text 'Zilvinas Norvilis'
      text 'Company Code: 735695'
      text 'Address: Birutes 42-2, 87119 Telšiai'
      stroke_bounds
    end

    bounding_box([275, 650], width: 275, height: 200) do
      text 'CLIENT'
      text @invoice.client.name
      text "Company Code: #{@client.code}"
      text "Address: #{@client.full_address}"
      stroke_bounds
    end
  end
end
