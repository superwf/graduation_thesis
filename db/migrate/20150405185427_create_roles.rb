class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, limit: 100
      t.timestamps null: false
    end
  end
end
