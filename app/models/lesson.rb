class Lesson < ApplicationRecord
    has_many :exercises
    has_many :phrases, through: :exercises
    belongs_to :list
end
