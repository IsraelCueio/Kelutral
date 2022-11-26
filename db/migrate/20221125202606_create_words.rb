class CreateWords < ActiveRecord::Migration[7.0]
  def change
    create_table :words do |t|
      t.string :name
      t.string :audio
      t.belongs_to :word_class, foreign_key: true

      t.timestamps
    end
  end
end
