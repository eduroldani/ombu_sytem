class AddLastContactToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :last_contact, :datetime
    add_column :students, :is_cancelled, :boolean
  end
end
