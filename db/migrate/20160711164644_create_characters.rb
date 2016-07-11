class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :brief
      t.text :description

      t.timestamps
    end
  end
end
