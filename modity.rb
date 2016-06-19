has_many :group_user_connections
  has_many :users, through: :group_user_connections	



  class User < ActiveRecord::Base
  has_many :group_user_connections 
  has_many :groups, through: :group_user_connections
end