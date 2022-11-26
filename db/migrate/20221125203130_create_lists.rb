class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.text :description
      t.boolean :check
      t.belongs_to :section, foreign_key: true

      t.timestamps
    end
  end
end
