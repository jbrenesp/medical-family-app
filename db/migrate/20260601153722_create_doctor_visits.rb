class CreateDoctorVisits < ActiveRecord::Migration[8.1]
  def change
    create_table :doctor_visits do |t|
      t.references :family_member, null: false, foreign_key: true
      t.references :illness, null: true, foreign_key: true
      t.string :doctor_name
      t.string :doctor_city
      t.date :visit_date
      t.text :notes
      t.string :visit_type

      t.timestamps
    end
  end
end
