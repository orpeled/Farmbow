class CreateUserActions < ActiveRecord::Migration
  def change
    create_table :user_actions do |t|
      t.integer :user_id
      t.integer :action_id
      t.string :picture_exists
      t.string :picture_path

      t.timestamps
    end
  end
end
