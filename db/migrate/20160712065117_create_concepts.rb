class CreateConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :concepts do |t|
      t.string :name
      t.text :description
      t.integer :character_id
      t.string :type

      t.timestamps
    end
  end
end
