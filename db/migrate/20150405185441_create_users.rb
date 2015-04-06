class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :email
      t.string :tel
      t.string :name
      t.integer :role_id
      t.timestamps null: false
    end
    add_index :users, :role_id
  end
end
