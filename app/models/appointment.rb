class Appointment < ApplicationRecord
    validates :local_id, :fecha, presence: true

    has_many :matchs
end
