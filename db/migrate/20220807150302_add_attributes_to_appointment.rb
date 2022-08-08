class AddAttributesToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :title,    :string, null: false, default: ""
    add_column :appointments, :question, :text,   null: false, default: ""
    add_column :appointments, :status,   :string, null: false, default: "pending"
  end
end
