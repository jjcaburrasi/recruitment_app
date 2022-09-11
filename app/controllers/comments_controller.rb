class CommentsController < ApplicationController
before_action :logged_in_user
before_action :admin_user
  
def create
    job = Job.find(params[:job_id])
    user = User.find(params[:user_id])
    Comment.create_comment(job, user, params[:content])
    flash[:success]= "Comment created"
    redirect_to request.referrer
end

def destroy
    job = Job.find(params[:job_id])
    current_user.unapply(job)
    redirect_to user
end

end
