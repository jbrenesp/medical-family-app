class CreateVaccines < ActiveRecord::Migration[8.1]
  def change
    create_table :vaccines do |t|
      t.references :family_member, null: false, foreign_key: true
      t.string :name
      t.date :vaccine_date
      t.date :next_due_date
      t.integer :dose_number
      t.text :notes

      t.timestamps
    end
  end
end
