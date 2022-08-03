class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_email
      t.string :contact_phone
      t.date :date_of_birth
      t.string :school
      t.boolean :is_deleted
      t.boolean :is_converted
      t.string :channel

      t.timestamps
    end
  end
end
