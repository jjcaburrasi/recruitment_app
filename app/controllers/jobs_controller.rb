class JobsController < ApplicationController
    before_action :logged_in_user, only: [:show]
    before_action :admin_user, only: [:edit, :destroy]

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
    end

    def index
        @jobs = Job.page params[:page] 
    end

    def kanban
        @job = Job.find(params[:job_id])
    end

end
