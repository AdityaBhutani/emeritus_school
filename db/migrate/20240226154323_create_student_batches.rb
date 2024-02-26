# frozen_string_literal: true

class CreateStudentBatches < ActiveRecord::Migration[7.1]
  def change
    create_table :student_batches do |t|
      t.references :student, null: false, foreign_key: true
      t.references :batch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
