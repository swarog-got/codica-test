class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
  
    add_index :appointments, :patient_id
    add_index :appointments, :doctor_id
    add_index :appointments, [:patient_id, :doctor_id]
  end
end
