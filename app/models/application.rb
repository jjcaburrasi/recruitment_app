class Application < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :job, class_name: "Job"
  belongs_to :stage, class_name: "Stage"

  validates :user_id, presence: true
  validates :job_id, presence: true
  validates :stage_id, presence: true

  def promote
    job = stage.job
    next_stage = job.next_stage(stage)
    
    if !next_stage.equals?(stage)
      update_attribute(:stage, next_stage)
    end
  end

  def go_back_promote
    previous_stage = job.previous_stage(stage)
    if !previous_stage.equals?(stage)
      update_attribute(:stage, previous_stage)
    end
  end

  def deactivate
    update_attribute(:active, false)
  end

end
