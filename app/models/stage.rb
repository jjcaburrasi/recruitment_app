class Stage < ApplicationRecord
  belongs_to :job
  
  has_many :applications
  
  validates :job_id, presence: true
  validates :name, presence: true
end
