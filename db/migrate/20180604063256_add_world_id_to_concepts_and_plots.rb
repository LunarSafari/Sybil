class AddWorldIdToConceptsAndPlots < ActiveRecord::Migration[5.1]
  def change
    add_column :concepts, :world_id, :integer, index: true
    add_column :plots, :world_id, :integer, index: true
  end
end
