class Job < ApplicationRecord
    has_many :applications, class_name: "Application",
                            foreign_key: "job_id",
                            dependent: :destroy
    has_many :users,        through: :applications, source: :user
    has_many :stages,       dependent: :destroy
    has_many :comments,     class_name: "Comment",
                            foreign_key: "job_id",
                            dependent: :destroy
    has_many :users_comment,through: :comments, source: :user

    has_many :offers

    validates :title, presence: true, length: { maximum: 50 }
    validates :description, presence: true

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
            sorted_stages[sorted_stages.index(stage)]
        else  
            sorted_stages[sorted_stages.index(stage)+1]
        end
    end

    def previous_stage(stage)
        if stage.id == 1
            sorted_stages[sorted_stages.index(stage)]
        else  
            sorted_stages[sorted_stages.index(stage)-1]
        end
    end

    def self.unpublished_jobs
        Job.where.not(status: "published")
    end

    def sorted_stages
        Stage.get_sorted_stages(id)
    end

    def status?(symbol)
        status.to_sym == symbol
    end

    def publish
        sorted_stages.map{ |s| s.update_attribute(:order, sorted_stages.index(s))}
        update_attribute(:status, "published")
    end

end
