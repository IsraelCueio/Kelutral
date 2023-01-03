class Phrase < ApplicationRecord
    has_many :phrase_translations, dependent: :destroy
    has_many :expressions, dependent: :destroy
    has_many :words, through: :expressions
    has_many :exercises, dependent: :destroy
    has_many :lessons, through: :exercises

    enum difficulty: {easy:0,medium:1,hard:2}

    def init
        self.audio ||= ";)"
        self.difficulty ||= 0
    end
end
