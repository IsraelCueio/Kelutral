class WordClass < ApplicationRecord
    has_many :words
    before_destroy :stop_destroy
    before_update :stop_update

    def stop_destroy
        if id == 0
            throw :abort
        end
    end

    def stop_update
        if id == 0
            throw :abort
        end
    end
end
