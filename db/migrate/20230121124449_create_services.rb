class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :unit
      t.string :amount
      t.string :price
      t.string :vat
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
