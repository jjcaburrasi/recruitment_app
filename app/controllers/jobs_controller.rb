class JobsController < ApplicationController
    before_action :logged_in_user, only: [:show]
    before_action :admin_user, only: [:new, :create, :edit, :destroy, :kanban, :publish]

    def new
        @job = Job.new
    end

    def create
        @job = Job.new(job_params)
        @job.save
        redirect_to @job
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
        @stages = @job.sorted_stages
    end

    def publish
        @job = Job.find(params[:job_id])
        @job.stages.map{ |s| s.order = @job.stages.index(s)}
        @job.publish
        if @job.save 
            flash[:success] = "The job has been published."
        end   
        redirect_to @job
    end

    private

        def job_params
            params.require(:job).permit(:title, :description)
        end
end
