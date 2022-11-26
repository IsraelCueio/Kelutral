class Section < ApplicationRecord
    has_many :lists, dependent: :destroy
end
