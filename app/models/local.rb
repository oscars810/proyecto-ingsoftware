class Local < ApplicationRecord
  validates :nombre, :descripcion, presence: true

  has_many_attached :images

  def carousel_photo input
    begin
      if self.images[input].variable?
        return self.images[input].variant(resize: '800x480!').processed
      else
        return self.images[input]
      end
    rescue => exception
      return "https://bulma.io/images/placeholders/800x480.png"
    end
  end

  belongs_to :user
  belongs_to :commune
  has_many :menus, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :valuations, dependent: :destroy
end
