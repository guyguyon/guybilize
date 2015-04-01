class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
	    t.string :name
	    t.string :email
	    t.string :password # of course that in a live system we wont store the password as is in the DB ....
      t.timestamps
    end
  end

	def down
		drop_table :users
	end
end
