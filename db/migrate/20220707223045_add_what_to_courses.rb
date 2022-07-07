class AddWhatToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :what, :text
    add_column :courses, :how, :text
    add_column :courses, :project, :text
  end
end
