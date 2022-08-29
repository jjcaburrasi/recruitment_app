class Comment < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :job, class_name: "Job"
  validates :user_id, presence: true
  validates :job_id, presence: true

  def self.get_all_comments_job_user(job, user)
    Comment.where("job_id = ? AND user_id = ?",job, user).order(created_at: :desc) 
  end

  def self.create_comment(job, user, content)
    Comment.transaction do 
      user.comment(job)
      comment=Comment.get_all_comments_job_user(job, user)
      comment.first.content = content
      comment.first.save
  end
  end
end

