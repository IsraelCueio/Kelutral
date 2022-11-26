class CreateExpressions < ActiveRecord::Migration[7.0]
  def change
    create_table :expressions do |t|
      t.belongs_to :word, foreign_key: true
      t.belongs_to :phrase, foreign_key: true

      t.timestamps
    end
  end
end
