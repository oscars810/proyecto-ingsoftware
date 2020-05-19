class Commune < ApplicationRecord
    has_many :users, dependent: :nullify
end
