class CreateMedications < ActiveRecord::Migration[8.1]
  def change
    create_table :medications do |t|
      t.references :family_member, null: false, foreign_key: true
      t.references :illness, null: true, foreign_key: true
      t.string :name
      t.string :medication_type
      t.date :start_date
      t.date :end_date
      t.text :notes

      t.timestamps
    end
  end
end
