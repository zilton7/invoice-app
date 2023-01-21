class ChangeTypeForUnitInServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :services, :unit, :string
    add_column :services, :unit, :integer, default: 0
  end
end
