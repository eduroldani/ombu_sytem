class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :short_description
      t.text :long_description
      t.date :date
      t.integer :capacity
      t.integer :price
      t.integer :minimun_age
      t.integer :max_age

      t.timestamps
    end
  end
end
