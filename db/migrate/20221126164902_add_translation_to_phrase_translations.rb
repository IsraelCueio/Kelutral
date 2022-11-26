class AddTranslationToPhraseTranslations < ActiveRecord::Migration[7.0]
  def change
    add_column :phrase_translations, :translation, :string
  end
end
