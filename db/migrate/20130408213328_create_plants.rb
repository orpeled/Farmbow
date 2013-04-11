class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :type
      t.text :initial_plant_info
      t.float :irrigation_quantity
      t.integer :irrigation_frequency
      t.float :irrigation_level
      t.text :irrigation_info
      t.float :fertilizer_quantity
      t.integer :fertilizer_frequency
      t.text :temperature_info
      t.float :safe_temp_min
      t.float :safe_temp_max
      t.float :sun_level
      t.text :sun_info

      t.timestamps
    end
  end
end
