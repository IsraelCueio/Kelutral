class CreatePhraseTranslations < ActiveRecord::Migration[7.0]
  def change
    create_table :phrase_translations do |t|
      t.belongs_to :phrase, foreign_key: true

      t.timestamps
    end
  end
end
