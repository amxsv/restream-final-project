class AddUserModel < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :role
      t.string :password_hash
    end
  end
end
