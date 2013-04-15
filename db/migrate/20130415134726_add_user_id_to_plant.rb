class AddUserIdToPlant < ActiveRecord::Migration
  def up
    change_table(:plants) do |t|

      t.integer :user_id, :null => false, :default => ""
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end


end
