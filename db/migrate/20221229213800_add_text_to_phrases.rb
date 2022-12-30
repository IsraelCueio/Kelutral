class AddTextToPhrases < ActiveRecord::Migration[7.0]
  def change
    add_column :phrases, :text, :string
  end
end
