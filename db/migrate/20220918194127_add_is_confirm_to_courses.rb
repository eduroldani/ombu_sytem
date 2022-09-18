class AddIsConfirmToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :is_confirm, :boolean, default: false
  end
end
