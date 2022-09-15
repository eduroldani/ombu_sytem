class DropDivisionsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :divisions
  end
end
