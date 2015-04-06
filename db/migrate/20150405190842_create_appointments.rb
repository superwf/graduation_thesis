class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :content
      t.string :file
      t.string :type
      t.integer :user_id
      t.integer :client_id
      t.string :status
      t.date :appoint_date

      t.timestamps null: false
    end
    add_index :appointments, :client_id
    add_index :appointments, :user_id
  end
end
