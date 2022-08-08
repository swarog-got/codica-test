class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :appointment, null: false, foreign_key: true
      t.text :answer

      t.timestamps
    end
  end
end
