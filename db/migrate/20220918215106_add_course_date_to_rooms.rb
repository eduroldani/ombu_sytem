class AddCourseDateToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :course_date, :date, default: Date.today

  end
end
