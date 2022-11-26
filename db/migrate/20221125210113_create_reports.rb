class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.boolean :check
      t.belongs_to :user, foreign_key: true
      t.belongs_to :exercise, foreign_key: true

      t.timestamps
    end
  end
end
