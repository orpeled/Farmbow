class AddImageToPlant < ActiveRecord::Migration
  def change
    add_column :plants, :image, :string
  end
end
