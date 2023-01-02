class Word < ApplicationRecord
    has_many :word_translations, dependent: :destroy
    belongs_to :word_class
    has_many :expressions, dependent: :destroy
    has_many :phrases, through: :expressions
    after_initialize :init

    def init
      self.word_class_id  ||= 0        #will set the default value only if it's nil
      self.audio ||= ";)"
    end
end
