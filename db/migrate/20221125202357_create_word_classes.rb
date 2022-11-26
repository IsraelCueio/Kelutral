class CreateWordClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :word_classes do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
