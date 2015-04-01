class CreateContacts < ActiveRecord::Migration
  def up
    create_table :contacts do |t|
	    t.integer :user_id
	    t.string :email
	    t.string :name # or any other mandatory field.....

      t.timestamps
    end
  end

  def down
	  drop_table :contacts
  end
end
