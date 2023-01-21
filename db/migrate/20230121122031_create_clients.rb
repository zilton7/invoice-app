class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :code
      t.string :vat_code
      t.string :address
      t.string :city
      t.string :post_code
      t.string :country
      t.string :website
      t.string :phone
      t.string :fax
      t.string :email
      t.string :notes

      t.timestamps
    end
  end
end
