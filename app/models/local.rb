class Local < ApplicationRecord
    validates :nombre, :descripcion, presence: true

    belongs_to :user
    belongs_to :commune
    has_many :menus, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :valuations, dependent: :destroy
end
