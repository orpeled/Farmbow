class UserAction < ActiveRecord::Base
  attr_accessible :action_id, :picture_exists, :picture_path, :user_id
  belongs_to :user
end
