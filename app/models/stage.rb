class Stage < ApplicationRecord
  belongs_to :job
  
  validates :job_id, presence: true
  validates :name, presence: true
end
