class AddImageToContact < ActiveRecord::Migration
  def change
    add_column :contact_messages, :contact_image, :string
  end
end
