class CreatePatientServices < ActiveRecord::Migration
  def change
    create_table :patient_services do |t|
      t.integer :patient_id
      t.string :type
      t.string :contact
      t.string :content
      t.timestamps null: false
    end

    add_index :patient_services, :patient_id
  end
end
