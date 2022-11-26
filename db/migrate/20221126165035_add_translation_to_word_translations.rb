class AddTranslationToWordTranslations < ActiveRecord::Migration[7.0]
  def change
    add_column :word_translations, :translation, :string
  end
end
