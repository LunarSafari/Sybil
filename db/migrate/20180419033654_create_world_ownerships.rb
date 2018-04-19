class CreateWorldOwnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :world_ownerships do |t|
      t.integer :user_id
      t.integer :world_id
      t.integer :type

      t.timestamps
    end

    add_index :world_ownerships, [:user_id, :world_id], unique: true
  end
end
