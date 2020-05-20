class Comment < ApplicationRecord
    belongs_to :local
    belongs_to :user
end
