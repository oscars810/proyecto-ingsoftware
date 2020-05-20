class Local < ApplicationRecord
    belongs_to :user
    belongs_to :commune
    has_many :menus
    has_many :comments
end
