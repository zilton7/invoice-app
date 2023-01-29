class AddTotalToServices < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :total, :string
  end
end
