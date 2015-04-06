class CreateTerminalRecords < ActiveRecord::Migration
  def change
    create_table :terminal_records do |t|
      t.integer :terminal_id
      t.integer :patient_id
      t.string :pulse_rate
      t.string :position
      t.string :temperature
      t.timestamps null: false
    end
    add_index :terminal_records, :terminal_id
    add_index :terminal_records, :patient_id
  end
end
