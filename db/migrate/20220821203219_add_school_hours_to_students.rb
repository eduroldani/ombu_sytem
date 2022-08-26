class AddSchoolHoursToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :school_hours, :string
  end
end
