class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :commune
  has_and_belongs_to_many :interests
  has_one :local, dependent: :destroy
  has_many :comments, dependent: :destroy
<<<<<<< HEAD
  has_many :matches
=======
<<<<<<< HEAD
  has_many :match_requests, dependent: :destroy
=======
>>>>>>> develop
  has_many :valuations, dependent: :nullify
>>>>>>> aae8b308a08b819ba5de4cf1d531906c13a0fa95
end
