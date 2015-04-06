class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.string :name
      t.string :tel
      t.text :remark
      t.timestamps null: false
    end
  end
end
