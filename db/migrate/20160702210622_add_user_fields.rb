class AddUserFields < ActiveRecord::Migration
  def change
    add_column :users, :state, :string
    add_column :users, :confirmation_token, :string

    change_column :users, :role, :string
    change_column_default :users, :role, 'worker'

    change_table :users do |t|
      t.rename :password_hash, :password_digest
    end
  end
end
