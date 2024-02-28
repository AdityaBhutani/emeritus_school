class CreateEnrollments < ActiveRecord::Migration[7.1]
  def change
    create_table :enrollments do |t|
      t.integer :status, default: 0
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :batch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
