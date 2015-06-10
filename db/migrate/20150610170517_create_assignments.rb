class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :name
      t.date :due

      t.timestamps null: false
    end
  end
end
