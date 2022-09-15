class AddIsHideToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :is_hide, :boolean, default: false
  end
end
