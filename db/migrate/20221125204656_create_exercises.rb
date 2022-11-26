class CreateExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :exercises do |t|
      t.boolean :check
      t.belongs_to :phrase, foreign_key: true
      t.belongs_to :lesson, foreign_key: true
      
      t.timestamps
    end
  end
end
