class UpdateVatMethodForInvoices < ActiveRecord::Migration[7.0]
  def change
    remove_column :invoices, :vat_method, :string
    add_column :invoices, :include_vat, :boolean, default: false
  end
end
