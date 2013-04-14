class AddCurrentTemperatureByLocation < ActiveRecord::Migration
  def up
    change_table(:users) do |t|
      #Current Temperature
      t.float :current_temperature, :null => false, :default => 0.0
      end
  end

  def down

  end
end
