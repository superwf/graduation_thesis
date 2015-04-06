class CreatePatientRecords < ActiveRecord::Migration
  def change
    create_table :patient_records do |t|
      t.integer :patient_id
      t.string :type
      t.string :content
      t.string :file
      t.string :contact
      t.timestamps null: false
    end
    add_index :patient_records, :patient_id
  end
end
