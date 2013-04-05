class User < ActiveRecord::Base
  attr_accessible :email, :location, :name, :password, :username
end
