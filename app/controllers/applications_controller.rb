class ApplicationsController < ApplicationController
  before_action :logged_in_user
  
  def create
    @job = Job.find(params[:job_id])
    Application.create(job: @job, user: current_user, stage: @job.stages.first)
    redirect_to current_user
  end

  def show
    @application = Application.find(params[:id])
    job=@application.job_id
    user=@application.user_id
    @all_comments = Comment.get_all_comments_job_user(job, user)
  end

  def index
    @applications=User.jobs
  end


  def destroy
    job = Application.find(params[:id]).users
    current_user.unapply(job)
    redirect_to user
  end
     
  def promote
    app = Application.find(params[:id])
    stage = app.stage
    @job = stage.job
    next_stage = @job.next_stage(stage)
    app.update_attribute(:stage, next_stage)
    redirect_to kanban_path(job_id: @job.id)
  end
end
