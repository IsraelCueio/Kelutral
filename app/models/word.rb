class Word < ApplicationRecord
    has_many :word_translations, dependent: :destroy
    belongs_to :word_class
    has_many :expressions, dependent: :destroy
    has_many :phrases, through: :expressions
end
