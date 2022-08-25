class Application < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :job, class_name: "Job"
  belongs_to :stage, class_name: "Stage"

  validates :user_id, presence: true
  validates :job_id, presence: true
  validates :stage_id, presence: true
end
