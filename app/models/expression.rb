class Expression < ApplicationRecord
    belongs_to :phrase
    belongs_to :word
    accepts_nested_attributes_for :word, :phrase
end
