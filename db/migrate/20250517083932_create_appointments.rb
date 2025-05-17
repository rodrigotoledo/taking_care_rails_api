class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: { to_table: :users }
      t.references :patient, null: false, foreign_key: { to_table: :users }
      t.datetime :appointment_date, null: false
      t.string :status, default: 'scheduled'
      t.text :notes

      t.timestamps
    end
  end
end
