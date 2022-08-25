class JobsController < ApplicationController
    before_action :logged_in_user, only: [:show]
    before_action :admin_user, only: [:show, :edit, :destroy]

    def new
        @job = Job.new
    end

    def create
        @job = Job.new(title: params[:title], description: params[:description])
        @job.save
    end

    def edit

    end

    def show
        @job = Job.find(params[:id])

        @stages = @job.stages
        #@all_comments = Comment.get_all_comments_job_user(@job.id, $user_seeker.id)
    end

    def index
        @jobs = Job.page params[:page]
    end

end
