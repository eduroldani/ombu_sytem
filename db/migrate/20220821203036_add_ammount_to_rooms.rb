class AddAmmountToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :ammount, :integer
    add_column :rooms, :modified_price, :integer
  end
end
