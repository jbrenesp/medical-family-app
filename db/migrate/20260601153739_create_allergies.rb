class CreateAllergies < ActiveRecord::Migration[8.1]
  def change
    create_table :allergies do |t|
      t.references :family_member, null: false, foreign_key: true
      t.string :name
      t.string :severity
      t.string :allergy_type
      t.text :notes
      t.date :diagnosed_date

      t.timestamps
    end
  end
end
