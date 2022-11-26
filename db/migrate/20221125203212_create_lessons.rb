class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.boolean :check
      t.integer :experience
      t.belongs_to :list, foreign_key: true

      t.timestamps
    end
  end
end
