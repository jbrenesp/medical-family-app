class CreateCheckups < ActiveRecord::Migration[8.1]
  def change
    create_table :checkups do |t|
      t.references :family_member, null: false, foreign_key: true
      t.string :checkup_type
      t.date :date
      t.text :results
      t.text :notes

      t.timestamps
    end
  end
end
