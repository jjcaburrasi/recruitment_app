class Stage < ApplicationRecord
  belongs_to :job
  
  has_many :applications

  has_one_attached :challenge_file

  validates :job_id, presence: true
  validates :name, presence: true

  # validates :challenge_file, blob: { content_type: { in: 'application/pdf', message: 'is not a PDF' },
  #                           size: { less_than: 5.megabytes,
  #                                    message: "should be less than 5MB" }


  def challenge_path
    ActiveStorage::Blob.service.path_for(challenge_file.key)
  end
end
