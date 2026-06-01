class CreateIllnesses < ActiveRecord::Migration[8.1]
  def change
    create_table :illnesses do |t|
      t.references :family_member, null: false, foreign_key: true
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :notes

      t.timestamps
    end
  end
end
