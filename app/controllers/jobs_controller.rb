class JobsController < ApplicationController
    before_action :logged_in_user, only: [:show]
    
    def new

    end

    def show
        @job = Job.find(params[:id])
        #@all_comments = Comment.get_all_comments_job_user(@job.id, $user_seeker.id)
    end

    def index
        @jobs = Job.page params[:page]
    end

end
