class AddIrrigationLevelUpdatedAtToPlants < ActiveRecord::Migration
  def up
    change_table(:plants) do |t|

      t.datetime :irrigation_level_updated_at, :null => false, :default => DateTime.now
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

