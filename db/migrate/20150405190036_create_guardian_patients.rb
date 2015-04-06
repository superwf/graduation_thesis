class CreateGuardianPatients < ActiveRecord::Migration
  def change
    create_table :guardian_patients do |t|
      t.integer :patient_id
      t.integer :guardian_id
    end
    add_index :guardian_patients, :patient_id
    add_index :guardian_patients, :guardian_id
  end
end
