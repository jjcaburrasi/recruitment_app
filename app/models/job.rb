class Job < ApplicationRecord
    has_many :applications
    has_many :users,  through: :applications
    paginates_per 15

end
