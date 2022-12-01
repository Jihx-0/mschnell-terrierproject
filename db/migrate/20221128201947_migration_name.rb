class MigrationName < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :work_orders, :technicians
    add_foreign_key :work_orders, :locations
  end
end
