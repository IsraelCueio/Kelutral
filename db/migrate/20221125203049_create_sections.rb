class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :name
      t.text :description
      t.boolean :check

      t.timestamps
    end
  end
end
