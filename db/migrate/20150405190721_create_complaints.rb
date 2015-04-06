class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.integer :user_id
      t.integer :client_id
      t.string :content
      t.string :file
      t.string :type
      t.string :status

      t.timestamps null: false
    end
    add_index :complaints, :user_id
    add_index :complaints, :client_id
  end
end
