class CreateKnowledges < ActiveRecord::Migration[6.1]
  def change
    create_table :knowledges do |t|
      t.string :title
      t.string :description
      t.string :slides_link
      t.string :online_meeting_link
      t.string :documents_link
      t.timestamps
    end
  end
end
