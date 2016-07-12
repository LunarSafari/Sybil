class CreatePerspectives < ActiveRecord::Migration[5.0]
  def change
    create_table :perspectives do |t|
      t.integer :character_id
      t.integer :concept_id
      t.string :type
      t.text :content

      t.timestamps
    end
  end
end
