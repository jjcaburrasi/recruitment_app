class Job < ApplicationRecord
    has_many :applications
    has_many :users,  through: :applications
    has_many :stages
    has_many :comments
    paginates_per 15
end
