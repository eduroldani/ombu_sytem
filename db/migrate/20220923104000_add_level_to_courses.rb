class AddLevelToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :level, :string, default: "Nivel 1"
  end
end
