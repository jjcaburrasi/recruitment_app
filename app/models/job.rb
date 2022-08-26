class Job < ApplicationRecord
    has_many :applications, class_name: "Application",
                            foreign_key: "job_id",
                            dependent: :destroy
    has_many :users,        through: :applications, source: :user
    has_many :stages
    has_many :comments,     class_name: "Comment",
                            foreign_key: "job_id",
                            dependent: :destroy
    has_many :users_comment,through: :comments, source: :user
    paginates_per 15

    def apply(user)
        users << user
    end

    def unapply(user)
        users.delete(user)
    end

    def applied?(user)
        users.include?(user)
    end

    def comment(user)
        users_comment << user
    end

    def next_stage(stage)
        if stage.id == stages.length
            stages[stages.index(stage)]
        else  
            stages[stages.index(stage)+1]
        end
        
    end

    def previous_stage(stage)
        if stage.id == 1
            stages[stages.index(stage)]
        else  
            stages[stages.index(stage)-1]
        end
    end

    def self.unpublished_jobs
        Job.where(published: false)
    end
end
