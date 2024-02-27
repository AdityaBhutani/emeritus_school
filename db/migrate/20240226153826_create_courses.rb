# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.text :description
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end

    add_index :courses, :name, unique: true
  end
end
