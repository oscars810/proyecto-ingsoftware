class MatchRequest < ApplicationRecord
    belongs_to :solicitante, class_name: 'User'
    belongs_to :solicitado, class_name: 'User'
end
