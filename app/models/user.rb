class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :commune
  has_and_belongs_to_many :interests
  has_one :local, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :match_requests, dependent: :destroy
  has_many :valuations, dependent: :nullify
end
