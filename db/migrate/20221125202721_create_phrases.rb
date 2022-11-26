class CreatePhrases < ActiveRecord::Migration[7.0]
  def change
    create_table :phrases do |t|
      t.integer :difficulty
      t.string :audio

      t.timestamps
    end
  end
end
