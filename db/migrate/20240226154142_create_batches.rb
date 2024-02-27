# frozen_string_literal: true

class CreateBatches < ActiveRecord::Migration[7.1]
  def change
    create_table :batches do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
