# frozen_string_literal: true

class CreateStudentBatches < ActiveRecord::Migration[7.1]
  def change
    create_table :student_batches do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :batch, null: false, foreign_key: true

      t.timestamps
    end

    add_index :student_batches, %i[student_id batch_id], unique: true
  end
end
