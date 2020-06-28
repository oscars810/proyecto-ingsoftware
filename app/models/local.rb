class Local < ApplicationRecord
  validates :nombre, :descripcion, presence: true

  has_many_attached :images

  def carousel_photo input
    if self.images[input].variable?
      return self.images[input].variant(resize: '800x480!').processed
    else
      return self.images[input]
    end
  end

  belongs_to :user
  belongs_to :commune
  has_many :menus, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :valuations, dependent: :destroy
end
