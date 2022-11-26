class List < ApplicationRecord
    has_many :lessons, dependent: :destroy
    belongs_to :section
end
