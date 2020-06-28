class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def comment_avatar
    begin
      if self.avatar.variable?
        return self.avatar.variant(resize: '128x128!').processed
      else
        return self.avatar
      end
    rescue => exception
      # La imagen ha sido eliminada
      return "https://bulma.io/images/placeholders/128x128.png"
    end
  end

  def match_avatar
    begin
      if self.avatar.variable?
        return self.avatar.variant(resize: '480x600!').processed
      else
        return self.avatar
      end
    rescue => exception
      # La imagen ha sido eliminada
      return "https://bulma.io/images/placeholders/480x600.png"
    end
  end

  belongs_to :commune
  has_and_belongs_to_many :interests
  has_one :local, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :matches
  has_many :match_requests
  has_many :valuations, dependent: :nullify
end
