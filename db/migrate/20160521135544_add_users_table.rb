class AddUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.integer :password
  		t.string :phone
  		t.string :string

  		t.timestamps null: false
  	end
  end
end
