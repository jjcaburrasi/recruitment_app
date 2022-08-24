class Job < ApplicationRecord
    has_many :applications, class_name: "Application",
                            foreign_key: "job_id",
                            dependent: :destroy
    has_many :users,  through: :applications, source: :user
    has_many :stages, dependent: :destroy
    has_many :comments
    paginates_per 15

    def apply(user)
        users << user
    end

    def unapply(user)
        users.delete(user)
    end

    def applied?(user)
        users.includes?(user)
    end
end
