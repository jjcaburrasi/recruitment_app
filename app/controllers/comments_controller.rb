class CommentsController < ApplicationController
before_action :logged_in_user

def create
    job = Job.find(params[:job_id])
    user = User.find(params[:user_id])
    user.comment(job)
    comment=Comment.where("job_id = ? AND user_id = ?", params[:job_id], params[:user_id]).order(created_at: :desc)
    comment.first.content = params[:content]
    comment.first.save

    redirect_to user
end

def destroy
    job = Application.find(params[:id]).users
    current_user.unapply(job)
    redirect_to user
end

end
