class CreateTerminals < ActiveRecord::Migration
  def change
    create_table :terminals do |t|
      t.string :sn
      t.integer :patient_id
      t.timestamps null: false
    end
    add_index :terminals :patient_id
    add_index :terminals :sn
  end
end
