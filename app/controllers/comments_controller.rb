class CommentsController < ApplicationController
before_action :logged_in_user

def create
    job = Job.find(params[:job_id])
    user = User.find(params[:user_id])
    Comment.create_comment(job, user, params[:content])
    redirect_to application
end

def destroy
    job = Application.find(params[:id]).users
    current_user.unapply(job)
    redirect_to user
end

end
