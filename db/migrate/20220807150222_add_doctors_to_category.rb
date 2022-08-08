class AddDoctorsToCategory < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :category, index: true
  end
end
