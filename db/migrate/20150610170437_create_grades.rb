class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :assignment_id
      t.integer :score
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
