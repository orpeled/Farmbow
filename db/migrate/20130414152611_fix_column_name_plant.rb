class FixColumnNamePlant < ActiveRecord::Migration
    def change
      rename_column :plants, :type, :type_of_plant
    end
  end
