# frozen_string_literal: true

class CreateSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.references :school_admin, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :schools, :name, unique: true
  end
end
