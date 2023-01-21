class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :client, null: false, foreign_key: true
      t.date :creation_date
      t.date :pay_until
      t.string :vat_method
      t.string :discount
      t.jsonb :extra_stuff

      t.timestamps
    end
  end
end
