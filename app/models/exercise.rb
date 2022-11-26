class Exercise < ApplicationRecord
    belongs_to :phrase
    belongs_to :lesson
    has_many :reports, dependent: :destroy
end
