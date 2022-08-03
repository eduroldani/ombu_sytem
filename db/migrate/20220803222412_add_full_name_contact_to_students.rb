class AddFullNameContactToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :full_name_contact, :string
    add_column :students, :allow_social, :boolean
  end
end
